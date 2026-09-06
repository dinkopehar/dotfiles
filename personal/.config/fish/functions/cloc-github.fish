function cloc-github
    if test (count $argv) -eq 1; or test (count $argv) -eq 2

    set --function github_repo (string replace "https://github.com/" "" $argv[1])
    set --function repository (string split '/' --field 2 $github_repo)

    if test -e /tmp/$repository
        command rm -rf /tmp/$repository
    end

    git clone -q $argv[1] /tmp/$repository

    if test (count $argv) -eq 2
        cloc /tmp/$repository/$argv[2]
    else
        cloc /tmp/$repository
    end

    else
    echo "Use `cloc-github https://github.com/hello/world` to count LOCs."
    return 1
    end
end