# docker-forensics-tools
This project runs various forensics tools in docker containers

# BUILD AND RUN
- `git clone https://github.com/ilostab/docker-forensics-tools.git && cd docker-forensics-tools`
- `cd <tool-folder>`
- `docker build -t <tool-name> . --no-cache`
- `docker run <tool-name>`

# ADDED IN THIS PROJECT
- [X] [pypykatz](https://github.com/skelsec/pypykatz)
- [X] [Thor Enterprise Scanner](https://www.nextron-systems.com/thor) `docker run --hostname <hostname> <tool-name>`
- [X] [sidr](https://github.com/strozfriedberg)
- [X] [yara-x](https://virustotal.github.io/yara-x/docs/intro/getting-started/) | includes Yara-Forge rules in `/app/rules/`
- [X] [hayabusa](https://github.com/Yamato-Security/hayabusa)

# OTHER PROJECTS
- [log2timeline](https://plaso.readthedocs.io/en/latest/sources/user/Installing-with-docker.html): `docker run log2timeline/plaso log2timeline.py --version`
- [volatility2](): `docker run -v $PWD:/workspace sk4la/volatility -f /workspace/volatile.mem `
- [volatility3](https://github.com/sk4la/volatility3-docker) `docker run -v $PWD:/workspace sk4la/volatility3 -f /workspace/volatile.mem windows.pslist`
- [velociraptor](https://github.com/weslambert/velociraptor-docker) `see github project`

# Similar project
- [CinCan](https://gitlab.com/CinCan/tools) CinCan tools

# Export Docker image 
- `docker save <image-name> | gzip > <image-name>.tar.gz`

# Import Docker image 
- `gunzip -c <image-name>.tar.gz | docker load` 