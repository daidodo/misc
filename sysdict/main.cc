#include <sys/types.h>
#include <dirent.h>
#include <iostream>
#include <fstream>
#include <string>
#include <cctype>
#include <vector>
#include <deque>
#include <map>
#include <set>
#include <cassert>

using namespace std;

#define __DEBUG     1

class Dic
{
    vector<map<string, set<string>>> dic;
public:
    void add(const string & word, const string & file){
        string w = check(word);
        if(w.empty())
            return;
        if(w.size() > dic.size())
            dic.resize(w.size());
        dic[w.size() - 1][w].insert(file);
    }
    void print() const{
        for(const auto & m : dic)
            for(const auto & p : m){
                cout<<p.first<<endl;
#if __DEBUG
                for(const auto & s : p.second)
                    cout<<'\t'<<s<<endl;
#endif
            }
    }
private:
    string check(string s){
        for(auto & c : s){
            if('_' == c || ('0' <= c && c <= '9'))
                return string();
            c = tolower(c);
        }
        return s;
    }
};

Dic dic;
set<string> flist;

void parse(const string & line, const string & file){
    const char * const kSymbols = "_abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
    for(size_t i = 0;i < line.size();){
        const auto p = line.find_first_of(kSymbols, i);
        if(p == string::npos)
            return;
        const auto n = line.find_first_not_of(kSymbols, p);
        dic.add(line.substr(p, n - p), file);
        i = n;
    }
}

bool processFile(const string & file){
    if(file.empty())
        return true;
    ifstream inf(file.c_str());
    if(!inf.is_open()){
        cerr<<"cannot open file '"<<file<<"'\n";
        return false;
    }
    int ln = 1;
    for(string line;;++ln){
        if(!getline(inf, line))
            break;
        parse(line, file);
    }
    return true;
}

void processDir(const string & path){
    deque<string> que{path};
    for(;!que.empty();que.pop_front()){
        auto & name = que.front();
        if(name.empty())
            continue;
        const auto dir = opendir(name.c_str());
        if(dir == nullptr){
            processFile(name);
            continue;
        }
        if(*name.rbegin() != '/')
            name.push_back('/');
        for(auto ent = readdir(dir);ent != nullptr;ent = readdir(dir)){
            if(ent->d_name[0] == '.')   // skip '.' '..' and hidden files
                continue;
            if(DT_REG == ent->d_type){
                flist.insert(name + ent->d_name);
            }else if(DT_DIR == ent->d_type)
                que.push_back(name + ent->d_name);
        }
        closedir(dir);
    }
}

void usage(const char * exe){
    cerr<<"Usage: "<<exe<<" pathname1 [pathname2...]\n";
}

int main(int argc, char *argv[])
{
    if(argc < 2){
        usage(argv[0]);
        return 1;
    }
    for(int i = 1;i < argc;++i)
        processDir(argv[i]);
#if __DEBUG
    for(const auto & s : flist)
        cout<<s<<endl;
#else
    for(const auto & s : flist)
        processFile(s);
    dic.print();
#endif
    return 0;
}
