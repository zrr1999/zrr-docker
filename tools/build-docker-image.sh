path=$1

commit_id=$(git rev-parse --short HEAD)
for folder in $(ls -d $path/*/); do
  if [ -f "${folder}Dockerfile" ]; then
    echo "Building image for ${folder}"
    tag=zrr1999/$(basename $folder):$commit_id
    docker build -t $tag $folder
    docker push $tag
  fi
done

