#include "inc.h"

// Find the lowest common ancestor of all the deepest level leaves in a tree (NOT binary).

class Solution {
public:
    const MultiwayTreeNode * LCA(const MultiwayTreeNode * root){
        return help(root).second;
    }
    pair<int, const MultiwayTreeNode *> help(const MultiwayTreeNode * root){
        if(!root)
            return make_pair(0, nullptr);
        pair<int, int> s;
        const MultiwayTreeNode * lca = nullptr;
        for(const MultiwayTreeNode * c : root->children){
            auto r = help(c);
            if(r.first > s.first){
                s = make_pair(r.first, 1);
                lca = r.second;
            }else if(r.first == s.first)
                ++s.second;
        }
        /* Explanation:
         *  1. If root has no children, then LCA is the root;
         *  2. If root has only 1 child and it's a leaf, then LCA is the root;
         *  3. If only 1 child C has max D, then LCA(root) = LCA(C);
         *  4. If 2 or more children have max D, then LCA is the root;
         */
        if(lca == nullptr || s.first == 1 || s.second > 1)
            lca = root;
        return make_pair(s.first + 1, lca); // (D, LCA)
    }
};

int main(){
    {
        cout<<Solution().LCA(nullptr)<<endl;
    }{
        MultiwayTreeNode root(1);
        cout<<Solution().LCA(&root)->val<<endl;
    }{
        MultiwayTreeNode n1(1);
        MultiwayTreeNode n2(2);
        n1.children.push_back(&n2);
        cout<<Solution().LCA(&n1)->val<<endl;
    }{
        MultiwayTreeNode n1(1), n2(2), n3(3);
        n1.children.push_back(&n2);
        n1.children.push_back(&n3);
        cout<<Solution().LCA(&n1)->val<<endl;
    }{
        MultiwayTreeNode n1(1), n2(2), n3(3), n4(4);
        n1.children.push_back(&n2);
        n1.children.push_back(&n3);
        n3.children.push_back(&n4);
        cout<<Solution().LCA(&n1)->val<<endl;
    }{
        MultiwayTreeNode n1(1), n2(2), n3(3), n4(4), n5(5), n6(6);
        n1.children.push_back(&n2);
        n1.children.push_back(&n3);
        n3.children.push_back(&n4);
        n2.children.push_back(&n5);
        n5.children.push_back(&n6);
        cout<<Solution().LCA(&n1)->val<<endl;
    }
    return 0;
}
