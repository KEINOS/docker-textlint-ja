#shellcheck shell=sh

# 読点は1文中に3つまで
Describe 'rule: max-ten'
    # Golden case
    It 'should NOT error if the sentence has 3 "ten" punctuation marks of less'
        max_comma() {
            echo 'てか、もう、何を言っているか、頭に入らん。' | textlint --stdin
        }

        When call max_comma
        The output should be blank
        The status should be success # status is 0
    End

    # Error case
    It 'should error if the sentence has more than 3 "ten" punctuation marks'
        max_comma() {
            echo 'てか、もう、何を、言っているか、頭に、入らん。' | textlint --stdin
        }

        When call max_comma
        The output should include "一つの文で\"、\"を4つ以上使用しています"
        The status should be failure # status is 1-255
    End
End
