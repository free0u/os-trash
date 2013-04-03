main(argc, argv) {
  int pipefd[2]
  return {
    pipeTag, [pipefd], rest1(pipeResult) {
      return {
        forkTag, [], rest2(forkResult) {
          if (forkResult) {
            return {
              dup2Tag, [pipefd, 1], rest3(dup2Result) {
                return {
                  closeTag, [pipefd[0]], rest4(closeResult) {
                    return {
                      closeTag, [pipefd[1]], rest5(closeResult1) {
                        return {
                          execlTag, ["/bin/ls", "ls", NULL], rest6(execlResult) {
                            return {
                              exitTag, [0], NULL
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          } else {
            return {
              dup2Tag, [pipefd, 0], rest7(dup2Result) {
                return {
                  closeTag, [pipefd[0]], rest8(closeResult) {
                    return {
                      closeTag, [pipefd[1]], rest9(closeResult1) {
                        return {
                          execlTag, ["/bin/grep", "grep", "main", NULL], rest10(execlResult) {
                            return {
                              exitTag, [0], NULL
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
}
