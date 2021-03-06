Feature: Configuration, Configuration, Configuration

  Scenario: run the main script with tokens set in the git configuration

    Given a git repo in directory "blegga" with config:
        | semaphore.authtoken    | foo   |
        | semaphore.projecttoken | bar   |
    When I run `git-semaphore --git-config` in "blegga" directory
    Then the exit status should be 0
     And the output should match /git config --local --replace-all semaphore.authtoken "foo"/
     And the output should match /git config --local --replace-all semaphore.projecttoken "bar"/
