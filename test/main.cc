#include "inc.h"

class Solution {
public:
    vector<string> findAllConcatenatedWordsInADict(vector<string>& words) {
        unordered_set<string> s(words.begin(), words.end());
        vector<string> ret;
        for(const auto & w : words){
            vector<bool> dp(w.size());
            for(size_t i = 0;i + 1 < w.size();++i){
                if(!dp[i] && !s.count(w.substr(0, i + 1)))
                    continue;
                for(size_t j = i + 1;j < w.size();++j)
                    if(s.count(w.substr(i + 1, j - i)) > 0)
                        dp[j] = true;
                if(dp.back()){
                    ret.push_back(w);
                    break;
                }
            }
        }
        return ret;
    }
};

int main(){
    {
        vector<string> in{"cat","cats","catsdogcats","dog","dogcatsdog","hippopotamuses","rat","ratcatdogcat"};
        print(Solution().findAllConcatenatedWordsInADict(in));
    }{
        vector<string> in{"a", "aa", "aaa", "aaaa", "aaaaa"};
        print(Solution().findAllConcatenatedWordsInADict(in));
    }{
        vector<string> in{"abc"};
        print(Solution().findAllConcatenatedWordsInADict(in));
    }
    return 0;
}
