#shellcheck shell=sh

# 漢字よりもひらがなで表記したほうが読みやすい副詞を指摘する
Describe 'rule: ja-hiragana-fukushi'
    # Golden case
    It 'should NOT error if the sentence has 3 commas of less'
        Data
            #|item1 あいにく、そのようなことはない。
            #|item2 あくまで、それは私の考えだ。
        End

        When call textlint --stdin
        The output should be blank
        The status should be success # status is 0
    End

    # Error case
    It 'should error if the sentence has more than 3 commas'
        Data
            #|item1 生憎、そのようなことはない。
            #|item2 飽くまで、それは私の考えだ。
        End

        When call textlint --stdin
        The output should include "ひらがなで表記したほうが読みやすい副詞"
        The status should be failure # status is 1-255
    End
End
