# Docker

## Containers

Show running containers:

```
❯ docker ps
CONTAINER ID   IMAGE            COMMAND                  CREATED         STATUS         PORTS     NAMES
6c88d228c07b   java-test:v2.0   "/__cacert_entrypoin…"   6 minutes ago   Up 6 minutes             agitated_bardeen
```

Show all containers:

```
❯ docker ps -a
CONTAINER ID   IMAGE            COMMAND                  CREATED          STATUS                      PORTS     NAMES
6c88d228c07b   java-test:v2.0   "/__cacert_entrypoin…"   7 minutes ago    Up 7 minutes                          agitated_bardeen
c11d9946a3c7   63333562b7d6     "/__cacert_entrypoin…"   7 minutes ago    Exited (0) 7 minutes ago              ecstatic_cohen
0e37bf2154f7   d4396495746c     "/__cacert_entrypoin…"   11 minutes ago   Exited (0) 7 minutes ago              stupefied_keldysh
610874c3d8c3   630891cbea48     "/__cacert_entrypoin…"   11 minutes ago   Exited (1) 11 minutes ago             laughing_dijkstra
7438af993aef   33b26f628278     "bash"                   12 minutes ago   Exited (0) 12 minutes ago             dazzling_chaplygin
63f48be76a5b   d94c1d7e4649     "/__cacert_entrypoin…"   13 minutes ago   Exited (0) 13 minutes ago             priceless_meninsky
6de7b66cf8cb   d94c1d7e4649     "/__cacert_entrypoin…"   4 hours ago      Exited (0) 4 hours ago                musing_meitner
ee49e13d9954   c6639e522a1e     "bash"                   4 hours ago      Exited (0) 4 hours ago                quizzical_burnell
d5082f9cdda9   c6639e522a1e     "/__cacert_entrypoin…"   4 hours ago      Exited (2) 4 hours ago                fervent_grothendieck
d74df287d925   c6639e522a1e     "/__cacert_entrypoin…"   4 hours ago      Exited (127) 4 hours ago              busy_clarke
69d2c40a6779   c6639e522a1e     "/__cacert_entrypoin…"   4 hours ago      Exited (127) 4 hours ago              hopeful_shamir
e6089acf0701   c6639e522a1e     "/__cacert_entrypoin…"   4 hours ago      Exited (0) 4 hours ago                pedantic_cartwright
71213ca95eb6   c6639e522a1e     "/__cacert_entrypoin…"   13 hours ago     Exited (127) 13 hours ago             crazy_hawking
```

Show all containers' IDs only ("quiet" output):

```
❯ docker ps -aq
6c88d228c07b
c11d9946a3c7
0e37bf2154f7
610874c3d8c3
7438af993aef
63f48be76a5b
6de7b66cf8cb
ee49e13d9954
d5082f9cdda9
d74df287d925
69d2c40a6779
e6089acf0701
71213ca95eb6
```

Stop specific container:

```
❯ docker stop 6c88d228c07b
6c88d228c07b
```

Remove all containers:

```
❯ docker rm $(docker ps -aq)
6c88d228c07b
c11d9946a3c7
0e37bf2154f7
610874c3d8c3
7438af993aef
63f48be76a5b
6de7b66cf8cb
ee49e13d9954
d5082f9cdda9
d74df287d925
69d2c40a6779
e6089acf0701
71213ca95eb6
```

## Images

Show all images:

```
❯ docker image ls -a
REPOSITORY   TAG       IMAGE ID       CREATED          SIZE
<none>       <none>    63333562b7d6   8 minutes ago    1.01GB
java-test    v2.0      a8f3476a48da   8 minutes ago    1.01GB
<none>       <none>    630891cbea48   12 minutes ago   1.01GB
<none>       <none>    d4396495746c   12 minutes ago   1.01GB
<none>       <none>    33b26f628278   13 minutes ago   1.01GB
<none>       <none>    d94c1d7e4649   4 hours ago      957MB
<none>       <none>    c6639e522a1e   13 hours ago     957MB
```

Remove specific image:

```
❯ docker rmi a8f3476a48da
Untagged: java-test:v2.0
Deleted: sha256:87e2db27dfbe10e9c682ef565507af55652bcb9078f5fea51d4aaceff4548083
```

Remove all images:

```
❯ docker rmi $(docker images -q)
Untagged: java-test:v2.0
Deleted: sha256:a8f3476a48dab0f0c29a83851fa9e30ebb3329290d5a7421730f7f959f8f2b90
Deleted: sha256:63333562b7d6ca9a302f441c12c3ba8c60301a51d303f1d459b4092798601876
Deleted: sha256:630891cbea48c4341054e5d5a590c34c1acde08f5ed89fa0151e38e3a78ab129
Deleted: sha256:d4396495746c454f05426b26a87878d6a094dd50c84d8db13f103d90dd176f1b
Deleted: sha256:33b26f6282781d7dfddb7277c13e62e93ef5e0d9022a629dcedf9d53c6d22224
Deleted: sha256:d94c1d7e4649b82ea53f417a547596da6d99544749dd732b38cc520d9323a44a
Deleted: sha256:c6639e522a1e71031a696d82ca3ee00064bda0dc60ea42a1caa8a1c71da85df6
```

Prune everything:

```
❯ docker system prune
WARNING! This will remove:
  - all stopped containers
  - all networks not used by at least one container
  - all dangling images
  - unused build cache

Are you sure you want to continue? [y/N] y
Deleted build cache objects:
q2raoarqbzlta3ehevc0srhfz
w0zc5uoql24z0lf0umlwf4w43
wt6bh6g9kxhy7ds1jhp6kmgry
j8w1da7j4i24gss2k44ii11zm
t3fapt3smbyx3rbyg3tp2sv40
yx95ig7fcb5m4id8d61x47pal
j5vh9vj5akobf47tep8iwfhkk
x567ere8tpbzka86taqdakfv2
b06nf6c6bn8ou3aon1wmh411g
rvy8lqkji9zdnbynpg4f93aun
mv6xdrvbpyq9ij3xtnqjbkj4j
w29lcuznd94lket5auysuek8r
1y4dfvdv5e1tdd9tmjlm5iooy
p6040eiqse71u0f2t2du0cizx
rvrc8yo3huo9393ktbpbbolco
sni6ah6855yc0xaqahtfhzsxm
rg2qvm4q6h0ispue8ceeq2dnq
ty1g68o8g9n7humhuh9cv7d3d
hij3w0fm5yphs4w4a6w7q3wg5
s2qmexp2uvggzqhvz7s6h6bim
fzgd62wqya3hky9wlmks5v543
j9z77o9r3hc52c859vmefx8zj
qzx6nmvp24atwq9xqtyuqpsv4
shyt5x31owz5q53hs4sfl6u69
v01x5ub5xol5plb3p4rozuviz
z4itbzq51mclqjp8ipb1rhor7
q4l55tb4awd2d3scy7kpjkncf
urxoee00k080xc9e5i3m5vl0y
rmnfis4s9924623knks2pg8s7
ubf66zlpe6kyyd68ek1emodyn
ikgxa3l63zfsdomikcr35lstc
i51atr961074xx1l6efgsxglh
pppcmzvjp3e67fd5rszvq8qr2

Total reclaimed space: 1.495GB
```

## Operations

### Keywords

*Paraphrasing "dockerfile cmd vs entrypoint" AI summary from Google...*

While `CMD` and `ENTRYPOINT` are both issue instructions to run when a container starts, they do different things:

- `CMD` (use it for default arguments)
  - Provides default commands or arguments for an executing container;
  - **Easily overridden** by passing arguments to `docker run`, meaning a Dockerfile with `CMD ["echo", "Hello"]` but CLI command of `docker run <image> World` will execute `echo World` instead;
  - If `ENTRYPOINT` is defined, acts as default arguments to said `ENTRYPOINT`.
- `ENTRYPOINT` (use it for required executions early on)
  - Defines main command/executable that **will always run** when the container starts;
  - Usually used for setting up container's primary process;
  - **Not easily overridden**.

Arguments passed to `docker run` are **appended** to the `ENTRYPOINT` command as parameters.

To change the `ENTRYPOINT` itself, you need to use the `--entrypoint` flag with docker run.

If both `ENTRYPOINT` and `CMD` are present, `CMD` provides the default arguments to the `ENTRYPOINT`. E.g., if `ENTRYPOINT ["nginx"]` and `CMD ["-g", "daemon off;"]` are defined the result is `nginx -g daemon off;` being executed by default. *Note that these instructions are in exec form.*

Per [Docker blog post](https://www.docker.com/blog/docker-best-practices-choosing-between-run-cmd-and-entrypoint/):

> In the shell form, the command is run in a **subshell**, typically `/bin/sh -c` on Linux systems. This form is useful because it allows shell processing (like **variable expansion**, wildcards, etc.), making it more flexible for certain types of commands (see this shell scripting article for examples of shell processing).
>
> However, it also means that the process running your command isn’t the container’s PID 1, which can lead to issues with signal handling because signals sent by Docker (like `SIGTERM` for graceful shutdowns) are received by the shell rather than the intended process.
> 
> The exec form **does not invoke a command shell**. This means the command you specify is **executed directly** as the container’s PID 1, which is important for correctly handling signals sent to the container. Additionally, this form **does not perform shell expansions**, so it’s more secure and predictable, especially for specifying arguments or commands from external sources.

Helpful thread on [Stack Overflow](https://stackoverflow.com/questions/47904974/what-are-shell-form-and-exec-form).

Below is an example of how to safely resolve an environment variable in an `ENTRYPOINT` command:

```Dockerfile
ENTRYPOINT [ "sh", "-c", "echo $SOMENAME" ]
```

### Terminal

Interactive pseudo-terminal (PTY/TTY) for specific container, as described [here](https://spacelift.io/blog/docker-exec).

First, obtain container ID.

```
❯ docker ps
CONTAINER ID   IMAGE         COMMAND                  CREATED         STATUS         PORTS                                            NAMES
88e3364578a4   local-spark   "/__cacert_entrypoin…"   6 seconds ago   Up 6 seconds   0.0.0.0:4040->4040/tcp, 0.0.0.0:8080->8080/tcp   local-spark-1
```

Then, connect using `docker exec -it [container-id]`. Note that **for a Spark container, we need the `bash` keyword**.

```
❯ docker exec -it 25632e0fe75b bash
[root@88e3364578a4 /]#
```

It's now possible to interact with this environment:

```
[root@88e3364578a4 /]# ls
afs  bin  boot	__cacert_entrypoint.sh	dev  etc  home	lib  lib64  media  mnt	opt  proc  root  run  sbin  srv  sys  tmp  usr	var
[root@88e3364578a4 /]# ls opt/
java  spark
[root@88e3364578a4 /]# ls opt/spark/
bin  conf  data  examples  jars  kubernetes  LICENSE  licenses	NOTICE	python	R  README.md  RELEASE  sbin  yarn
[root@88e3364578a4 /]# ls opt/spark/jars/
activation-1.1.1.jar				       hive-metastore-2.3.9.jar				 kubernetes-model-batch-6.7.2.jar			       parquet-common-1.13.1.jar
aircompressor-0.25.jar				       hive-serde-2.3.9.jar				     kubernetes-model-certificates-6.7.2.jar		   parquet-encoding-1.13.1.jar
algebra_2.12-2.0.1.jar				       hive-service-rpc-3.1.3.jar			 kubernetes-model-common-6.7.2.jar			       parquet-format-structures-1.13.1.jar
annotations-17.0.0.jar				       hive-shims-0.23-2.3.9.jar			 kubernetes-model-coordination-6.7.2.jar		   parquet-hadoop-1.13.1.jar
antlr4-runtime-4.9.3.jar			       hive-shims-2.3.9.jar				     kubernetes-model-core-6.7.2.jar			       parquet-jackson-1.13.1.jar
antlr-runtime-3.5.2.jar				       hive-shims-common-2.3.9.jar			 kubernetes-model-discovery-6.7.2.jar              pickle-1.3.jar
aopalliance-repackaged-2.6.1.jar		   hive-shims-scheduler-2.3.9.jar	     kubernetes-model-events-6.7.2.jar			       postgresql-42.7.6.jar
arpack-3.0.3.jar				           hive-storage-api-2.8.1.jar			 kubernetes-model-extensions-6.7.2.jar			   py4j-0.10.9.7.jar
arpack_combined_all-0.1.jar			       hk2-api-2.6.1.jar				     kubernetes-model-flowcontrol-6.7.2.jar			   RoaringBitmap-0.9.45.jar
arrow-format-12.0.1.jar				       hk2-locator-2.6.1.jar				 kubernetes-model-gatewayapi-6.7.2.jar			   rocksdbjni-8.3.2.jar
arrow-memory-core-12.0.1.jar			   hk2-utils-2.6.1.jar				     kubernetes-model-metrics-6.7.2.jar			       scala-collection-compat_2.12-2.7.0.jar
arrow-memory-netty-12.0.1.jar			   httpclient-4.5.14.jar		         kubernetes-model-networking-6.7.2.jar		       scala-compiler-2.12.18.jar
arrow-vector-12.0.1.jar				       httpcore-4.4.16.jar				     kubernetes-model-node-6.7.2.jar			       scala-library-2.12.18.jar
audience-annotations-0.5.0.jar			   istack-commons-runtime-3.0.8.jar	     kubernetes-model-policy-6.7.2.jar			       scala-parser-combinators_2.12-2.3.0.jar
avro-1.11.2.jar					           ivy-2.5.1.jar					     kubernetes-model-rbac-6.7.2.jar			       scala-reflect-2.12.18.jar
avro-ipc-1.11.2.jar				           jackson-annotations-2.15.2.jar	     kubernetes-model-resource-6.7.2.jar			   scala-xml_2.12-2.1.0.jar
avro-mapred-1.11.2.jar				       jackson-core-2.15.2.jar				 kubernetes-model-scheduling-6.7.2.jar			   shims-0.9.45.jar
blas-3.0.3.jar					           jackson-core-asl-1.9.13.jar			 kubernetes-model-storageclass-6.7.2.jar		   slf4j-api-2.0.7.jar
bonecp-0.8.0.RELEASE.jar			       jackson-databind-2.15.2.jar			 lapack-3.0.3.jar					               snakeyaml-2.0.jar
breeze_2.12-2.1.0.jar				       jackson-dataformat-yaml-2.15.2.jar	 leveldbjni-all-1.8.jar					           snakeyaml-engine-2.6.jar
...
```

Exit like so:

```
[root@25632e0fe75b /]# exit
```

### Pip

#### Installation

Access shell:

```
❯ docker exec -it 88e3364578a4 /bin/bash
[root@88e3364578a4 /]#
```

I tried the below for some reason...

```
[root@88e3364578a4 /]# microdnf install pip3

(microdnf:117): librhsm-WARNING **: 16:49:55.237: Found 0 entitlement certificates

(microdnf:117): librhsm-WARNING **: 16:49:55.239: Found 0 entitlement certificates
Downloading metadata...
Downloading metadata...
Downloading metadata...
error: No package matches 'pip3'
[root@88e3364578a4 /]# pip3 --version
bash: pip3: command not found
[root@88e3364578a4 /]# python3 --version
Python 3.9.21
[root@88e3364578a4 /]# python --version
Python 3.9.21
[root@88e3364578a4 /]# pip --version
bash: pip: command not found
```

Opted to run install command as outlined [here](https://pip.pypa.io/en/stable/installation/#get-pip-py): `python -m ensurepip --upgrade`

```
[root@88e3364578a4 /]# python -m ensurepip --upgrade
Looking in links: /tmp/tmpui32yjm5
Processing /tmp/tmpui32yjm5/setuptools-53.0.0-py3-none-any.whl
Processing /tmp/tmpui32yjm5/pip-21.3.1-py3-none-any.whl
Installing collected packages: setuptools, pip
Successfully installed pip-21.3.1 setuptools-53.0.0
WARNING: Running pip as the 'root' user can result in broken permissions and conflicting behaviour with the system package manager. It is recommended to use a virtual environment instead: https://pip.pypa.io/warnings/venv
```

Note that this will install command as `pip3`, **not** `pip`:

```
[root@88e3364578a4 /]# pip --version
bash: pip: command not found
[root@88e3364578a4 /]# pip3 --version
pip 21.3.1 from /usr/local/lib/python3.9/site-packages/pip (python 3.9)
```

#### Packages

To see a list of installed libraries...

```
[root@88e3364578a4 /]# pip3 list
Package           Version
----------------- -----------
attrs             25.3.0
blinker           1.9.0
Brotli            1.1.0
certifi           2025.4.26
cffi              1.17.1
cryptography      45.0.3
exceptiongroup    1.3.0
h11               0.16.0
h2                4.2.0
hpack             4.1.0
hyperframe        6.1.0
idna              3.10
kaitaistruct      0.10
outcome           1.3.0.post0
pip               21.3.1
pyasn1            0.6.1
pycparser         2.22
pyOpenSSL         25.1.0
pyparsing         3.2.3
PySocks           1.7.1
selenium          4.33.0
selenium-wire     5.1.0
setuptools        53.0.0
sniffio           1.3.1
sortedcontainers  2.4.0
trio              0.30.0
trio-websocket    0.12.2
typing_extensions 4.13.2
urllib3           2.4.0
websocket-client  1.8.0
wsproto           1.2.0
zstandard         0.23.0
WARNING: You are using pip version 21.3.1; however, version 25.1.1 is available.
You should consider upgrading via the '/usr/bin/python3 -m pip install --upgrade pip' command.
```

### Spark

```
[root@88e3364578a4 /]# spark-shell
/opt/spark/bin/load-spark-env.sh: line 68: ps: command not found
Setting default log level to "WARN".
To adjust logging level use sc.setLogLevel(newLevel). For SparkR, use setLogLevel(newLevel).
25/06/02 16:57:56 WARN NativeCodeLoader: Unable to load native-hadoop library for your platform... using builtin-java classes where applicable
Spark context Web UI available at http://85a2292da170:4040
Spark context available as 'sc' (master = local[*], app id = local-1748883476790).
Spark session available as 'spark'.
Welcome to
      ____              __
     / __/__  ___ _____/ /__
    _\ \/ _ \/ _ `/ __/  '_/
   /___/ .__/\_,_/_/ /_/\_\   version 3.5.0
      /_/

Using Scala version 2.12.18 (OpenJDK 64-Bit Server VM, Java 11.0.27)
Type in expressions to have them evaluated.
Type :help for more information.

scala>
```



```
❯ docker ps
CONTAINER ID   IMAGE            COMMAND                  CREATED         STATUS         PORTS                                            NAMES
ddc8f565b7b4   dpage/pgadmin4   "/entrypoint.sh"         3 minutes ago   Up 3 minutes   443/tcp, 0.0.0.0:8888->80/tcp                    pgadmin4_container
7d89df4c8196   local-spark      "/__cacert_entrypoin…"   3 minutes ago   Up 3 minutes   0.0.0.0:4040->4040/tcp, 0.0.0.0:8080->8080/tcp   local-spark-1
cf4670adb23f   postgres:15      "docker-entrypoint.s…"   3 minutes ago   Up 3 minutes   0.0.0.0:5432->5432/tcp                           local-pgdatabase-1
❯ docker exec -it ddc8f565b7b4 /bin/bash
ddc8f565b7b4:/pgadmin4$ ls
LICENSE             commit_hash         config_distro.py    gunicorn_config.py  pgAdmin4.py         pgacloud            run_pgadmin.py      version.py
branding.py         config.py           docs                migrations          pgAdmin4.wsgi       pgadmin             setup.py
ddc8f565b7b4:/pgadmin4$ cd /
ddc8f565b7b4:/$ ls
bin            entrypoint.sh  home           media          opt            proc           run            srv            tmp            var
dev            etc            lib            mnt            pgadmin4       root           sbin           sys            usr            venv
ddc8f565b7b4:/$ ls tmp
ddc8f565b7b4:/$ exit

❯ docker exec -it 7d89df4c8196 /bin/bash
[root@7d89df4c8196 /]# ls
afs  bin  boot	__cacert_entrypoint.sh	dev  etc  home	lib  lib64  media  mnt	opt  proc  root  run  sbin  srv  sys  tmp  usr	var
[root@7d89df4c8196 /]# ls tmp
green_tripdata_2019-09.csv  hsperfdata_root  taxi_zone_lookup.csv
[root@7d89df4c8196 /]# exit
```

### psql

psql default attempt:

```
❯ psql
WARNING: password file "/Users/jonathon/.pgpass" has group or world access; permissions should be u=rw (0600) or less
psql: error: connection to server on socket "/tmp/.s.PGSQL.5432" failed: FATAL:  database "jonathon" does not exist
❯ ls /tmp
/tmp
❯ vim /tmp/.s.PGSQL.5432
```

First attempt at accessing Postgres database container:

```
❯ psql -h localhost -U admin -d nyc_taxi
WARNING: password file "/Users/jonathon/.pgpass" has group or world access; permissions should be u=rw (0600) or less
psql: error: connection to server at "localhost" (::1), port 5432 failed: FATAL:  role "admin" does not exist
❯ chmod 0600 /Users/jonathon/.pgpass
```

Was unable to connect on second try:

```
❯ psql -h localhost -U admin -d nyc_taxi
psql: error: connection to server at "localhost" (::1), port 5432 failed: FATAL:  role "admin" does not exist
❯ psql "host=127.0.0.1 port=5432 dbname=nyc_taxi user=admin password=admin"
psql: error: connection to server at "127.0.0.1", port 5432 failed: FATAL:  role "admin" does not exist
```

Why? I asked [ChatGPT](https://chatgpt.com/g/g-p-689f4637d070819187a78bc0e99c7376-data-engineering/c/689f7aec-b72c-8327-bbb3-e4496ec9bb53), and then I tried this:

```
❯ docker ps --format "table {{.Names}}\t{{.Ports}}"
NAMES                PORTS
pgadmin4_container   443/tcp, 0.0.0.0:8888->80/tcp
local-pgdatabase-1   0.0.0.0:5432->5432/tcp
```

The above is normal and expected but upon checking port usage...

```
❯ lsof -i :5432
COMMAND     PID     USER   FD   TYPE             DEVICE SIZE/OFF NODE NAME
postgres   1745 jonathon    7u  IPv6 0x15ef2cee6a2fc243      0t0  TCP localhost:postgresql (LISTEN)
postgres   1745 jonathon    8u  IPv4 0xe2f6c28beccab86d      0t0  TCP localhost:postgresql (LISTEN)
com.docke 78083 jonathon  207u  IPv6 0x166b8560be820a3e      0t0  TCP *:postgresql (LISTEN)
```

- `postgres` → host Postgres server running
- `com.docker.backend` → Docker’s networking service.

Both listed, that means there's a **conflict**. 

I stopped the host Postgres instance with `brew services stop postgresql`.

Had I needed both, I could have changed the Docker mapping in `compose.yaml` to a different host port—e.g., set `ports:   - "15432:5432"` and connect with `psql -h 127.0.0.1 -p 15432 -U admin -d appdb`.

Reran 



```
❯ brew services list
Name              Status  User     File
mongodb-community none             
postgresql@14     started jonathon ~/Library/LaunchAgents/homebrew.mxcl.postgresql@14.plist
❯ brew services stop postgresql
Stopping `postgresql@14`... (might take a while)
==> Successfully stopped `postgresql@14` (label: homebrew.mxcl.postgresql@14)
❯ lsof -i :5432
COMMAND     PID     USER   FD   TYPE             DEVICE SIZE/OFF NODE NAME
com.docke 78083 jonathon  207u  IPv6 0x166b8560be820a3e      0t0  TCP *:postgresql (LISTEN)
❯ brew uninstall mongodb-community
Uninstalling /opt/homebrew/Cellar/mongodb-community/6.0.1... (10 files, 199.6MB)
```
