#shellcheck shell=sh

# JTF 日本語標準スタイルガイド（翻訳用）に準拠するルール・セット

# 漢数字と算用数字を使い分ける
Describe 'rule: arabic-kanji-numbers (from preset-jtf-style)'
    # Golden case
    It 'should NOT error if the word uses arabic numbers for counting'
        Data
            #|item1 1 億 2805 万人です。
            #|item2 3 つのボタンです。
            #|item3 第 3 回大会です。
            #|item4 第 3 章です。
            #|item5 20 回です。
            #|item6 第 3 節です。
            #|item7 4 種類です。
            #|item8 11 種類です。
        End
        When call textlint --stdin
        The output should be blank
        The status should be success # status is 0
    End

    # Error case
    It 'should error if the number in the world is countable and not arabic numbers'
        Data
            #|item1 第三章です。
            #|item2 二十回です。
            #|item3 一億百十万人です。
            #|item4 百八つのボタンです。
            #|item5 第三回大会です。
            #|item6 サンフランシスコマラソン第三回大会です。
        End
        When call textlint --stdin
        The status should be failure # status is 1-255
        The output should include "数量を表現し、数を数えられるものは算用数字を使用します"
        The output should include "任意の数に置き換えても通用する語句がこれに該当します"
    End

    # Error case
    It 'should error if the arabic number in the world should be kanji number in conventional manner'
        Data
            #|item1 これは世界1です。
            #|item2 1 部の文章です。
            #|item3 これは花の 1 種です。
            #|item4 朝 1 番に起きます。
            #|item5 数 100 倍の威力を持ちます。
        End
        When call textlint --stdin
        The status should be failure # status is 1-255
        The output should include "慣用的表現、熟語、概数、固有名詞、副詞など、漢数字を使用することが一般的な語句では漢数字を使います"
    End
End
