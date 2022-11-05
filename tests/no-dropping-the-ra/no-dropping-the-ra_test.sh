#shellcheck shell=sh

# ら抜き言葉を使用しない
Describe 'rule: no-dropping-the-ra'
    # Golden case
    It 'should NOT error if the sentence is not dropping the "ら"'
        no_dropping_the_ra() {
            echo 'もう、そこには居られない。' | textlint --stdin
        }

        When call no_dropping_the_ra
        The output should be blank
        The status should be success # status is 0
    End

    # Error case
    It 'should error if the sentence has a dropping "ら"'
        no_dropping_the_ra() {
            echo 'もう、そこには居れない。' | textlint --stdin
        }

        When call no_dropping_the_ra
        The output should include "ら抜き言葉を使用しています"
        The status should be failure # status is 1-255
    End
End
