# SkillsUSA 2023 Regionals - Cybersecurity
A CTF style task for the SkillsUSA 2023 Regionals Cybersecurity competition.

## Requirements
- `docker`

## Installation
```
git clone https://github.com/milesrack/regionals-ctf.git
cd regionals-ctf
sudo docker build -t regionals-ctf .
```

## Deployment
```
sudo docker run --rm -it -p 8080:8080 -p 22:22 -p 8009:8009 regionals-ctf:latest
```
