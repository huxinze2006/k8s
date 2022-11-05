images=(
registry.cn-hangzhou.aliyuncs.com/k8s_sai/kube-apiserver:v1.25.3
registry.k8s.io/kube-apiserver:v1.25.3
registry.cn-hangzhou.aliyuncs.com/k8s_sai/kube-controller-manager:v1.25.3
registry.k8s.io/kube-controller-manager:v1.25.3
registry.cn-hangzhou.aliyuncs.com/k8s_sai/kube-scheduler:v1.25.3
registry.k8s.io/kube-scheduler:v1.25.3
registry.cn-hangzhou.aliyuncs.com/k8s_sai/kube-proxy:v1.25.3
registry.k8s.io/kube-proxy:v1.25.3
registry.cn-hangzhou.aliyuncs.com/k8s_sai/pause:3.8
registry.k8s.io/pause:3.8
registry.cn-hangzhou.aliyuncs.com/k8s_sai/etcd:3.5.4-0
registry.k8s.io/etcd:3.5.4-0
registry.cn-hangzhou.aliyuncs.com/k8s_sai/coredns:v1.9.3
registry.k8s.io/coredns/coredns:v1.9.3
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