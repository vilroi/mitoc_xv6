## Notes

### Implementation of pipes:

I have created the following shell script, and have ran the following command. 
```bash
    > cat test.sh
        #!/usr/bin/env bash
        sleep inifinity
        cat file.out

    ./test.sh | sort | uniq
```

The resulting process tree is shown below. 
``` bash
    bash(27755)-+-bash(27761)---sleep(27764)
                |-sort(27762)
                `-uniq(27763)
```

As shown by the output of pstree, the three processes that are connected with pipes are all siblings, and share a common parent.
It is the responsibility of the parent process to call wait(2), allowing the system to release the associated resources of the child.

Perhaps something like the following is needed:
```c
    for (int i = 0; i < nchild; i++) 
        wait(NULL)
```

10:57 AM.
With the current implementation, the process tree is like the following:
```bash
make(45343)───sh(45344)───xv6sh(45345)───xv6sh(45347)───xv6sh(45349)─┬─sort(45350)    
                                                                     └─xv6sh(45351)─┬─uniq(45352)
                                                                                    └─wc(45353)
```


