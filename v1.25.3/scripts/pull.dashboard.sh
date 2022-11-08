images=(
registry.cn-hangzhou.aliyuncs.com/k8s_sai/dashboard-metrics-scraper:v1.0.8
kubernetesui/metrics-scraper:v1.0.8
registry.cn-hangzhou.aliyuncs.com/k8s_sai/dashboard:v2.7.0
kubernetesui/dashboard:v2.7.0
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