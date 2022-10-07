# wsl_portproxy
 exposes the wsl ports to your local area network

## Usage
 It's simple, just tell to script what ports you need separeted by comma

 `./portproxy -ports 3000,3056`

 You canspecify a distro and an user if you wnat

 `./portproxy -distro Ubuntu-20.04 -user lucas -ports 3000`

## Parameters

 | Parameter | type | Optional | Default value  |
 |-----------|------|----------|----------------|
 | distro    | string |yes      | default wsl distro |
 | user      | string |yes      | returns from whoami of linux |
 | ports     | list of numbers (comma separeted) |no       | 

---
<br/>

### I hope this can help you
