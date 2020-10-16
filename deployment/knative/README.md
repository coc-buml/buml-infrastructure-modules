# Knative Configurations

## Cheatsheet

| Name                        | Command                                                                                                           |
| --------------------------- | ----------------------------------------------------------------------------------------------------------------- |
| List configurations         | `kubectl get configurations`                                                                                      |
| List all revisions          | `kubectl get revisions`                                                                                           |
| List all functions          | `kubectl get route`                                                                                               |
| List all gateways           | `kubectl get gateway --all-namespaces`                                                                            |
| List all related pods       | `watch "kubectl get pods -n istio-system; echo "\n"; kubectl get pods -n knative-serving"`                        |
| Get function domain name    | `kubectl get services.serving.knative.dev $conf_name -o=custom-columns=NAME:.metadata.name,DOMAIN:.status.domain` |
| Get ingress gateway service | `kubectl get svc knative-ingressgateway -n istio-system`                                                          |

## Custom Domain

**apply custom domain config**

```bash
kubectl apply --filename custom-config-domain.yaml
```

```bash
kubectl patch configmap/config-domain \
 --namespace knative-serving \
 --type merge \
 --patch '{"data":{"kn.buml.cc-n.dev":""}}'
```

**get url from service**

```bash
kubectl get route fastapi --output jsonpath="{.status.url}"
```

**check ip address of istio gateway**

```bash
export INGRESSGATEWAY=istio-ingressgateway

if kubectl get configmap config-istio -n knative-serving &> /dev/null; then
    export INGRESSGATEWAY=istio-ingressgateway
fi

kubectl get svc $INGRESSGATEWAY --namespace istio-system --output jsonpath="{.status.loadBalancer.ingress[*]['ip']}"
```

curl -H "Host: http://fastapi.default.kn.buml.cc-n.dev" http://20.54.226.116
