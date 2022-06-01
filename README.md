# Wanqol run with docker-compose

##### Run bash
1. Clone source wp
```
  git clone https://github.com/cainz-technology/cainz-WanQol-WEB-WP.git wanqol-wp
  cd wanqol-wp
  git checkout develop
```
2. Clone source frontend
```
  git clone https://github.com/cainz-technology/cainz-WanQol-WEB-front.git wanqol-frontend
  cd wanqol-frontend
  git checkout develop
```

3. Please check ``Line Sepanator`` is format ```LF``` for file ```*.sh```  in IDE tool
```
- db/run-update-db.sh
- wanqol-frontend/run-angular.sh
- wanqol-frontend/run-entrypoint.sh
- wanqol-frontend/run-ng-build.sh
- wanqol-frontend/run-node.sh
- wanqol-wp/docker-add-entrypoint.sh
```

4. Run docker compose
```
  docker-compose up -d
```

##### Link Check

1. Angular
     - Angular run Dev: [http://localhost:42000](http://localhost:42000)
     - Angular run Build: [http://localhost:420](http://localhost:420)
     - Rebuild:
       - ```docker exec -it angular bash```
       - ```cd  /src/angular-wanqol```
       - ```npm run build_dev:ssr```
       - Check the result: [http://localhost:420](http://localhost:420)

2. Node
     - [http://localhost:8080](http://localhost:8080)

3. Wordpress
     - [http://localhost:888](http://localhost:888)

4. PhpMyadmin
     - [http://localhost:880](http://localhost:880)

5. Mysql
   - Info
     ``` 
     host: 172.18.0.5
     user_root: root
     user: root
     pass: root
     database: cainz_wp
     ```
   - Pull database from Gcloud dev to local
     - ```docker exec -it mysql bash```
     - ```./run-update-db.sh```
     - Enter the password for gcloud dev and waiting....
6. WP account admin:
   - URL: [http://localhost:888/wp-admin](http://localhost:888/wp-admin)
```
  User: cainz_wp
  Pass: Fip^6%UKl5W$%qP9RPEY#NGQ
```
##### Docker basic commands
 1. List all container:
      - ```docker ps -a```
 2. Remove container by name:
      - ```docker rm -f {container_name}  ```
 3. Remove all container:
      - ```docker rm -f $(docker ps -a -q) ```
 4. List all images:
      - ```docker images```
 5. Remove image by name
      - ```docker rmi -f {image_name}```
 6. Remove all images
      - ```docker rmi -f $(docker images -q)```
 7. Exec container
      - ```docker exec -it {container_name} bash```
 8. View logs container
      - ```docker-compose logs -f {container_name}```

