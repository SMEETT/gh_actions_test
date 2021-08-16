echo "#################################################"
echo Install: Backend Dependencies
echo "#################################################"
cd /home/bf/gh_actions_test/backend
npm install
echo "#################################################"
echo Start: Backend via PM2
echo "#################################################"
pm2 delete test_backend
pm2 start /home/bf/gh_actions_test/backend/index.js --name "test_backend"
echo "#################################################"
echo Install: Frontend Dependencies
echo "#################################################"
cd /home/bf/gh_actions_test/frontend
npm install --production=false
echo "#################################################"
echo Start: Frontend Build
echo "#################################################"
npm run build
echo "#################################################"
echo Start: Frontend via PM2
echo "#################################################"
pm2 delete test_frontend
pm2 start npm --name "test_frontend" -- run serve
echo "#################################################"
echo Save: PM2
echo "#################################################"
pm2 save
echo "-------------------------------------------------"
echo "#################################################"
echo ALL DONE
echo "#################################################"
echo "-------------------------------------------------"
