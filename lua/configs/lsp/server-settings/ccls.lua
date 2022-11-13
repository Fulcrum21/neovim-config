return {
       init_options = {
        cache = { directory = "/tmp/ccls-cache"};
        clang = {
            extraArgs = {"--gcc-toolchain=/usr"}
        };
    }
}
