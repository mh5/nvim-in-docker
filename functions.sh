docker_nvim_build() {
  docker build -t nvim .
}

docker_nvim_run() {
  docker run \
	-d \
	--name nvim-env \
	--restart always \
	--network host \
	--mount "src=$PWD,target=$PWD,type=bind" \
	--mount "src=$HOME,target=$HOME,type=bind" \
	--mount "src=/tmp/.X11-unix,target=/tmp/.X11-unix,type=bind" \
	--mount "src=/etc/passwd,target=/etc/passwd,type=bind" \
	--user "${UID}" \
	--group-add "$(id -g)" \
	-w "$PWD" \
	-e DISPLAY \
	-e LANG \
	-e LC_ALL \
	-e LC_CTYPE \
	"nvim" \
	sleep infinity
}

docker_nvim_stop() {
  docker stop nvim-env
}

docker_nvim_rm() {
  docker rm nvim-env
}

nvim() {
  docker exec \
    --workdir "$PWD" \
    -it nvim-env \
    /opt/nvim/bin/nvim "$@"
}

