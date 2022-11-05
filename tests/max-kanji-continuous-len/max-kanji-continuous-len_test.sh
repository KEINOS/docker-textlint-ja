#shellcheck shell=sh

# 連続できる最大の漢字長は 6 文字まで
Describe 'rule: max-kanji-continuous-len'
    # Golden case
    It 'should NOT error if the sentence has 6 continuous kanjis'
        Data '核不拡散条約。'
        When call textlint --stdin
        The output should be blank
        The status should be success # status is 0
    End

    # Error case
    It 'should error if the sentence has more than 6 continuous kanjis'
        Data '天上天下唯我独尊。'
        When call textlint --stdin
        The output should include "漢字が7つ以上連続しています"
        The status should be failure # status is 1-255
    End
End
