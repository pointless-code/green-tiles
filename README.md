![GreenTiles](https://github.com/user-attachments/assets/7cbe1060-fddf-4ee2-a192-c246263e90aa)

## About GreenTiles

Makes your GitHub activity less depressing.

## Pull from docker

```bash
docker pull pointlesscode/green-tiles:latest

docker run  \
    -e GIT_EMAIL="your_git_email" \
    -e GIT_URL="your_github_repo_in_ssh" \
    -e START_DATE="2023-02-01" \
    -e END_DATE="2023-12-30" \
    -v path/to/your/local/ssh-key:/root/.ssh/my_ssh_key \
    pointlesscode/green-tiles
```

## Build it yourself
- clone the project and cd to folder
- build and run the image
```bash
docker build -t green-tiles .

docker run  \
    -e GIT_EMAIL="your_git_email" \
    -e GIT_URL="your_github_repo_in_ssh" \
    -e START_DATE="2023-02-01" \
    -e END_DATE="2023-12-30" \
    -v path/to/your/local/ssh-key:/root/.ssh/my_ssh_key \
    green-tiles 
```

## Social

<a href="https://pointlesscode.dev/">.less</a><br>
<a href="https://www.instagram.com/pointlesscode">Instagram</a><br>
<a href="https://x.com/pointlessCodes">Twitter</a><br>
<a href="https://github.com/pointless-code">GitHub</a><br>
<a href="https://hub.docker.com/u/pointlesscode">DockerHub</a>

## License

The project is open-sourced software licensed under the [MIT license](https://opensource.org/licenses/MIT).
