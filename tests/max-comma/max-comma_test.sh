#shellcheck shell=sh

# カンマは 1 文中に 3 つまで
Describe 'rule: max-comma'
    # Golden case
    It 'should NOT error if the sentence has 3 commas of less'
        Data
            #|item1 There should be no errors in this text.
            #|item2 0, 1, 2, 3
        End

        When call textlint --stdin
        The output should be blank
        The status should be success # status is 0
    End

    # Error case
    It 'should error if the sentence has more than 3 commas'
        Data
            #|item1 By the way, this, is, not, ok, sentence.
            #|item2 0, 1, 2, 3, 4
        End

        When call textlint --stdin
        The output should include "This sentence exceeds the maximum count of comma"
        The status should be failure # status is 1-255
    End
End
