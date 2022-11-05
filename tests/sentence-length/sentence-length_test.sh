#shellcheck shell=sh

# 1 文の長さは 100 文字以下とする
Describe 'rule: sentence-length'
    # Golden case
    It 'should NOT error if the sentence is 100 chars'
        # 100 chars
        longSentense="あいうえおあいうえおあいうえおあいうえおあいうえおあいうえおあいうえおあいうえおあいうえおあいうえおあいうえおあいうえおあいうえおあいうえおあいうえおあいうえおあいうえおあいうえおあいうえおあいうえ。"

        sentence_length() {
            echo "$longSentense"  | textlint --stdin
        }

        When call sentence_length
        The output should be blank
        The status should be success # status is 0
    End

    # Error case
    It 'should error if the sentence is over 100 chars'
        # 101 chars
        longSentense="あいうえおあいうえおあいうえおあいうえおあいうえおあいうえおあいうえおあいうえおあいうえおあいうえおあいうえおあいうえおあいうえおあいうえおあいうえおあいうえおあいうえおあいうえおあいうえおあいうえお。"

        sentence_length() {
            echo "$longSentense"  | textlint --stdin
        }

        When call sentence_length
        The output should include "Over 1 characters"
        The status should be failure # status is 1-255
    End
End
