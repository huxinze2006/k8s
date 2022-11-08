images=(
registry.cn-hangzhou.aliyuncs.com/k8s_sai/calico-node:v3.24.4
docker.io/calico/node:v3.24.4
registry.cn-hangzhou.aliyuncs.com/k8s_sai/calico-cni:v3.24.4
docker.io/calico/cni:v3.24.4
registry.cn-hangzhou.aliyuncs.com/k8s_sai/calico-kube-controllers:v3.24.4
docker.io/calico/kube-controllers:v3.24.4
)
h=0
for (( h >= 0 ;h < $(expr ${#images[*]} / 2 );h++))
do
   src=${images[$(expr $h \* 2 )]}
   tag=${images[$(expr $h \* 2  + 1)]}
#  echo "
   nerdctl -n k8s.io pull $src
   nerdctl -n k8s.io tag $src $tag
   nerdctl -n k8s.io rmi -f $src
#  "
done