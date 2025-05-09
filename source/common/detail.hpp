/*
    实现项目中用到的一些琐碎功能代码
    * 日志宏的定义
    * json的序列化和反序列化
    * uuid的生成
*/
#pragma once
#include <cstdio>
#include <ctime>
#include <iostream>
#include <string>
#include <memory>
#include <random>
#include <sstream>
#include <atomic>
#include <iomanip>
#include <jsoncpp/json/json.h>
#include <type_traits>
namespace bitrpc
{
#define LDBG 0
#define LINF 1
#define LERR 2

#define LDEFAULT LDBG



// 定义LOG日志，便于调试
#define LOG(level, format, ...)                                                                       \
    {                                                                                                 \
        if (level >= LDEFAULT)                                                                        \
        {                                                                                             \
            time_t t = time(NULL);                                                                    \
            struct tm *lt = localtime(&t);                                                            \
            char time_tmp[32] = {0};                                                                  \
            strftime(time_tmp, 31, "%m-%d %T", lt);                                                   \
            fprintf(stdout, "[%s][%s:%d] " format "\n", time_tmp, __FILE__, __LINE__, ##__VA_ARGS__); \
        }                                                                                             \
    }
#define DLOG(format, ...) LOG(LDBG, format, ##__VA_ARGS__);
#define ILOG(format, ...) LOG(LINF, format, ##__VA_ARGS__);
#define ELOG(format, ...) LOG(LERR, format, ##__VA_ARGS__);

    class JSON
    {
    public:
        // 输⼊输出型参数
        // root输⼊参数：表⽰要序列化的json对象
        // body输出参数: 表⽰序列化之后的字符串

        // class JSON_API StreamWriter {
        //     virtual int write(Value const& root, std::ostream* sout) = 0;
        //    }
        //  class JSON_API StreamWriterBuilder : public StreamWriter::Factory {
        //     virtual StreamWriter* newStreamWriter() const;
        //    }
        static bool serialize(const Json::Value &val, std::string &body) // 序列化
        {
            std::stringstream ss;
            // 先实例化一个工厂类对象
            Json::StreamWriterBuilder swb;
            // 通过工厂类对象来生产派生类对象
            std::unique_ptr<Json::StreamWriter> sw(swb.newStreamWriter());
            int ret = sw->write(val, &ss);
            if (ret != 0)
            {
                ELOG("json serialize failed!");
                return false;
            }
            body = ss.str();
            return true;
        }
        // 反序列化: 字符串 ->Json对象
        // 输⼊输出型参数
        // body输⼊参数: 表⽰需要反序列化的字符串
        // val输出参数：表⽰反序列化后的json对象

        // class JSON_API CharReader {
        //     virtual bool parse(char const* beginDoc, char const* endDoc, Value* root, std::string* errs) = 0;
        // }

        //  class JSON_API CharReaderBuilder : public CharReader::Factory {
        //     virtual CharReader* newCharReader() const;
        //  }
        static bool unserialize(const std::string &body, Json::Value &val) // 反序列化
        {
            Json::CharReaderBuilder crb;
            std::string errs;
            std::unique_ptr<Json::CharReader> cr(crb.newCharReader());
            bool ret = cr->parse(body.c_str(), body.c_str() + body.size(), &val, &errs);
            if (ret == false)
            {
                ELOG("json unserialize failed : %s", errs.c_str());
                return false;
            }
            return true;
        }
    };

    // UUID(Universally Unique Identifier), 也叫通⽤唯一识别码，通常由32位16进制数字字符组成。
    // UUID的标准型式包含32个16进制数字字符，以连字号分为五段，形式为8-4-4-4-12的32个字符，
    // 如：550e8400-e29b-41d4-a716-446655440000。
    // 在这里，uuid⽣成，我们采⽤⽣成8个随机数字，加上8字节序号，共16字节数组⽣成32位16进制字符的组合形式
    // 来确保全局唯一的同时能够根据序号来分辨数据
    class UUID
    {
    public:
        static std::string uuid()
        {
            std::stringstream ss;

            // 1. 构造一个机器随机数对象
            std::random_device rd; // 基于硬件设备（如操作系统的随机数生成器）来生成随机数，因此生成的随机数具有较高的随机性和不可预测性。
            // 2. 以机器随机数为种子构造伪随机数对象
            std::mt19937 generator(rd()); // 创建一个基于梅森旋转算法（Mersenne Twister algorithm）的伪随机数生成器对象
            // 3. 构造限定数据范围的对象
            std::uniform_int_distribution<int> distribution(0, 255);
            // 4. 生成8个随机数，按照特定格式组织成为16进制数字字符的字符串
            for (int i = 0; i < 8; i++)
            {
                if (i == 4 || i == 6)
                    ss << "-";
                ss << std::setw(2) << std::setfill('0') << std::hex << distribution(generator);
                // 设置下一个输出项的最小字段宽度为 2,不足补0；并将其转换至16进制；
            }
            ss << "-";
            // 5. 定义一个8字节序号，逐字节组织成为16进制数字字符的字符串
            static std::atomic<size_t> seq(1); //  00 00 00 00 00 00 00 01 //8字节
            // 可以确保对变量的读写操作是原子的，即在多线程环境下不会出现数据竞争的问题。
            size_t cur = seq.fetch_add(1); //+1操作
            for (int i = 7; i >= 0; i--)
            {
                if (i == 5)
                    ss << "-";
                ss << std::setw(2) << std::setfill('0') << std::hex << ((cur >> (i * 8)) & 0xFF);
            }
            return ss.str();
        }
    };
}