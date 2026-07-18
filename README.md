# Kubernetes

Kubernetes 리소스와 클러스터 운영 기능을 단계별로 실습하기 위한 매니페스트 저장소입니다. Pod, Deployment, Service, Ingress부터 ConfigMap, Secret, Storage, HPA, Scheduling, RBAC, Helm, Kustomize, NetworkPolicy, Add-on 설치 파일까지 폭넓게 정리되어 있습니다.

## 핵심 구성

| 경로 | 내용 |
| --- | --- |
| `kube/03` | 기본 Pod 생성 예제입니다. |
| `kube/04` | Namespace와 API 리소스 확인 실습입니다. |
| `kube/05` | Pod 심화 예제입니다. init container, multi container, env, liveness probe, resource request/limit을 다룹니다. |
| `kube/06` | Workload 리소스 예제입니다. Deployment, ReplicaSet, ReplicationController, DaemonSet, StatefulSet, Job, CronJob을 포함합니다. |
| `kube/07` | Service 실습입니다. ClusterIP, NodePort, LoadBalancer, Headless, ExternalName 구성이 있습니다. |
| `kube/08` | Ingress, TLS Ingress, Gateway API 예제입니다. |
| `kube/09` | 운영 배포 전략과 메타데이터 실습입니다. label, annotation, rolling update, blue-green, canary, nodeSelector를 다룹니다. |
| `kube/10` | ConfigMap 실습과 Nginx 설정 파일 예제입니다. |
| `kube/11` | Secret과 애플리케이션 배포 예제입니다. MongoDB, Mongo Express, PostgreSQL, Adminer 구성이 있습니다. |
| `kube/12` | Storage 실습입니다. emptyDir, hostPath, NFS, PV, PVC를 포함합니다. |
| `kube/13` | HPA 자동 스케일링 예제입니다. |
| `kube/14` | 스케줄링 제어 예제입니다. nodeSelector, nodeAffinity, podAffinity, taint/toleration, cordon/drain을 다룹니다. |
| `kube/15` | 사용자, 인증서, ServiceAccount, RBAC 실습입니다. |
| `kube/18` | Helm 권한 설정과 Kustomize base/overlay 예제입니다. |
| `kube/19` | Deployment와 Service 간 네트워크 연결 실습입니다. |
| `kube/20` | NetworkPolicy 예제입니다. |
| `kube/labs` | fanout, name-based ingress 등 추가 실습 과제입니다. |
| `kube/tools` | Calico, MetalLB, metrics-server, ingress-controller, Gateway API, Helm, nerdctl 등 클러스터 도구와 Add-on 파일입니다. |
| `kube/project5` | TensorFlow, MongoDB 같은 프로젝트성 배포 예제입니다. |

## 포함된 주요 리소스

- 기본 리소스: `Pod`, `Deployment`, `Service`, `Namespace`
- 운영 리소스: `ConfigMap`, `Secret`, `Ingress`, `HorizontalPodAutoscaler`
- 스토리지: `PersistentVolume`, `PersistentVolumeClaim`, `emptyDir`, `hostPath`, `NFS`
- 스케줄링: `nodeSelector`, `nodeAffinity`, `podAffinity`, `taint/toleration`
- 접근 제어: `ServiceAccount`, `Role`, `RoleBinding`, `ClusterRole`, `ClusterRoleBinding`, `CertificateSigningRequest`
- 네트워크 확장: `NetworkPolicy`, Gateway API, MetalLB, Calico, Ingress Controller

## 빠른 실행 예시

```bash
# 단일 매니페스트 적용
kubectl apply -f kube/07/svc/nginx-deploy.yml
kubectl apply -f kube/07/svc/nginx-nodeport-svc.yml

# 적용 상태 확인
kubectl get pod,svc -o wide

# 실습 리소스 삭제
kubectl delete -f kube/07/svc/nginx-nodeport-svc.yml
kubectl delete -f kube/07/svc/nginx-deploy.yml
```

## Kustomize 예시

```bash
kubectl apply -k kube/18/kustomize/base
kubectl apply -k kube/18/kustomize/overlays/prod
kubectl delete -k kube/18/kustomize/overlays/prod
```

## 추천 학습 순서

1. `kube/03`부터 `kube/07`까지 Pod, Workload, Service 기본 흐름을 익힙니다.
2. `kube/08`, `kube/09`에서 외부 접근과 배포 전략을 실습합니다.
3. `kube/10`, `kube/11`, `kube/12`에서 설정, 민감 정보, 스토리지를 연결합니다.
4. `kube/13`, `kube/14`, `kube/15`에서 운영 자동화, 스케줄링, 권한 제어를 확인합니다.
5. `kube/18` 이후에서 Helm, Kustomize, NetworkPolicy, Add-on 구성을 확장합니다.

## 주의

- 일부 YAML에는 실습 당시 생성된 인증서, 키, CSR, TLS 파일이 포함되어 있습니다. 운영 환경의 실제 비밀 정보는 저장소에 커밋하지 마세요.
- `kube/tools`에는 Add-on 설치 파일과 실행 바이너리가 포함되어 있어 용량이 큽니다.
- 매니페스트를 적용하기 전에 namespace, image tag, storage path, LoadBalancer 대역, Ingress/Gateway Controller 설치 여부를 확인하세요.
