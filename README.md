# docker-forensics-tools
- This project runs various forensics tools in docker containers.

| Verified | What | Example Raw | Example Run |
|---|---|---|---|
|- [X] | [pypykatz](https://github.com/skelsec/pypykatz) | `docker run ilostab6/pypykatz` | `docker run -v $PWD:/w/ ilostab6/pypykatz lsa minidump /w/lsa.dump` |
|- [ ] | [sidr](https://github.com/strozfriedberg) | `docker run ilostab6/sidr` | Row 2, Cell 3 |

- Rust projects are built with a Docker builder, then moved to a distroless docker run environment to make the image smaller.





# BUILD AND RUN
- `git clone https://github.com/ilostab/docker-forensics-tools.git && cd docker-forensics-tools`
- `chmod +x build.sh`
- `./build.sh`
- `docker run <tool-name>`

Alternative
- `cd <tool-folder>`
- `docker build -t <tool-name> . --no-cache`
- `docker run <tool-name>`

# ADDED IN THIS PROJECT
- [X] [pypykatz](https://github.com/skelsec/pypykatz)
- [X] [Thor Enterprise Scanner](https://www.nextron-systems.com/thor) `docker run --hostname <hostname> <tool-name>`
- [X] [sidr](https://github.com/strozfriedberg)
- [X] [yara-x](https://virustotal.github.io/yara-x/docs/intro/getting-started/) | includes Yara-Forge rules in `/app/rules/`
- [X] [hayabusa](https://github.com/Yamato-Security/hayabusa)
- [X] [chainsaw](https://github.com/WithSecureLabs/chainsaw) | includes rules from [SigmaHQ](https://github.com/SigmaHQ/sigma) in `/app/rules/sigma/`
- [X] [capa](https://github.com/mandiant/capa) | includes rules from [capa-rules](https://github.com/mandiant/capa-rules) in `/app/rules/`
- [X] [densityscout](https://www.sans.org/blog/finding-unknown-malware-with-densityscout/)
- [X] [regripper 4.0](https://github.com/keydet89/RegRipper4.0)

# OTHER PROJECTS
- [log2timeline](https://plaso.readthedocs.io/en/latest/sources/user/Installing-with-docker.html): `docker run log2timeline/plaso log2timeline.py --version`
- [volatility2](https://github.com/sk4la/volatility3-docker): `docker run -v $PWD:/workspace sk4la/volatility -f /workspace/volatile.mem `
- [volatility3](https://github.com/sk4la/volatility3-docker) `docker run -v $PWD:/workspace sk4la/volatility3 -f /workspace/volatile.mem windows.pslist`
- [velociraptor](https://github.com/weslambert/velociraptor-docker) `see github project`
- [clamav](https://github.com/Cisco-Talos/clamav) `sudo docker run clamav/clamav clamscan`

## VOL3 optimization for docker
- `sudo docker volume create symbols`
- `sudo docker run -v symbols:/usr/local/lib/volatility3/volatility3/symbols/ -v $PWD:/w sk4la/volatility3 -f /w/volatile.mem windows.pslist --save-config /w/volatile.conf`
- `sudo docker run -v symbols:/usr/local/lib/volatility3/volatility3/symbols/ -v $PWD:/w sk4la/volatility3 -c /w/volatile.conf`

# Similar project
- [CinCan](https://gitlab.com/CinCan/tools) CinCan tools

# Export Docker image 
- `docker save <image-name> | gzip > <image-name>.tar.gz`

# Import Docker image 
- `gunzip -c <image-name>.tar.gz | docker load` 
