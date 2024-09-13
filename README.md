# docker-forensics-tools
- This project runs various forensics tools in docker containers.

| Verified | What | Example Raw | Example Run |
|---|---|---|---|
| Y | [pypykatz](https://github.com/skelsec/pypykatz) | `docker run ilostab6/pypykatz` | `docker run -v $(pwd)::/w/ ilostab6/pypykatz lsa minidump /w/lsa.dump` |
| Y | [sidr](https://github.com/strozfriedberg/sidr) | `docker run ilostab6/sidr` | `docker run -v $(pwd):/w/ ilostab6/sidr sidr /w/` |
| Y | [yara-x](https://virustotal.github.io/yara-x/docs/intro/getting-started/) | `docker run ilostab6/yara-x` | `docker run -v $(pwd):/w/ ilostab6/yara-x yr scan /app/rules/ /w/capa_testfile.exe_` |
| Y | [hayabusa](https://github.com/Yamato-Security/hayabusa) | `docker run ilostab6/hayabusa` | `docker run -v $(pwd):/w/ h-dv hayabusa csv-timeline --file /w/Exec_sysmon_meterpreter_reversetcp_msipackage.evtx --no-wizard --min-level high` |
| Y | [chainsaw](https://github.com/WithSecureLabs/chainsaw) | `docker run ilostab6/chainsaw` | `docker run -v $(pwd):/w/ ilostab6/chainsaw chainsaw hunt /w/Exec_sysmon_meterpreter_reversetcp_msipackage.evtx -s /app/rules/ --mapping /app/mappings/sigma-event-logs-all.yml` |
| Y | [capa](https://github.com/mandiant/capa) | `docker run ilostab6/capa` | `docker run -v $(pwd):/w/ ilostab6/capa /w/capa_testfile.exe_ -r /app/rules/ -s /app/sigs/` |
| Y | [densityscout](https://www.sans.org/blog/finding-unknown-malware-with-densityscout/) | `docker run ilostab6/densityscout` | `docker run -v $(pwd):/w/ ilostab6/densityscout densityscout /w/capa_testfile.exe_` |
| N | [regripper 4.0](https://github.com/keydet89/RegRipper4.0) | `docker run ilostab6/regripper` | `docker run -v $(pwd):/w/ ilostab6/regripper` |

# Other projects
| Verified | What | Example Raw | Example Run |
|---|---|---|---|
| Y | [log2timeline](https://plaso.readthedocs.io/en/latest/sources/user/Installing-with-docker.html) | `docker run log2timeline/plaso` | `docker run -v $PWD:/w/ log2timeline/plaso log2timeline.py` |
| Y | [volatility2](https://github.com/sk4la/volatility3-docker) | `docker run sk4la/volatility` | `docker run -v $PWD:/w sk4la/volatility -f /w/volatile.mem` |
| Y | [volatility3](https://github.com/sk4la/volatility3-docker) | `docker run sk4la/volatility3` | `docker run -v $PWD:/w sk4la/volatility3 -f /w/volatile.mem windows.pslist` |
| Y | [velociraptor](https://github.com/weslambert/velociraptor-docker) | `docker run ...` | `docker run ...` |
| Y | [clamav](https://github.com/Cisco-Talos/clamav) | `sudo docker run clamav/clamav clamscan` | `sudo docker run -v $PWD:/w/ clamav/clamav clamscan /w/` |

## VOL3 optimization for docker
- `sudo docker volume create symbols`
- `sudo docker run -v symbols:/usr/local/lib/volatility3/volatility3/symbols/ -v $PWD:/w sk4la/volatility3 -f /w/volatile.mem windows.pslist --save-config /w/volatile.conf`
- `sudo docker run -v symbols:/usr/local/lib/volatility3/volatility3/symbols/ -v $PWD:/w sk4la/volatility3 -c /w/volatile.conf`

# BUILD AND RUN
- `git clone https://github.com/ilostab/docker-forensics-tools.git && cd docker-forensics-tools`
- `chmod +x build.sh`
- `./build.sh`
- `docker run <tool-name>`

Alternative
- `cd <tool-folder>`
- `docker build -t <tool-name> .`
- `docker run <tool-name>`

- Rust projects are built with a Docker builder, then moved to a distroless docker run environment to make the image smaller.

# Similar project
- [CinCan](https://gitlab.com/CinCan/tools) CinCan tools

# Export Docker image 
- `docker save <image-name> | gzip > <image-name>.tar.gz`

# Import Docker image 
- `gunzip -c <image-name>.tar.gz | docker load` 
