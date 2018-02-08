PHP_IMAGE_TAG='php:yourtag'
# Build a new php-fpm docker image that fits mysql
docker build -t $PHP_IMAGE_TAG ./util/Dockerfile

# Get typecho release files
TYPECHO_SAVE_FILE='www.tar.gz'
TYPECHO_RELEASE_URL='https://github.com/typecho/typecho/releases/download/v1.1-17.10.30-release/1.1.17.10.30.-release.tar.gz'
wget -O $TYPECHO_SAVE_FILE $TYPECHO_RELEASE_URL
mkdir -p data/www && tar -zxf $TYPECHO_SAVE_FILE -C ./data/www --strip-components=1 && rm -f $TYPECHO_SAVE_FILE
docker-compose up -d
