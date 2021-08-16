cd /home/bf/gh_actions_test/backend
echo "#################################################"
echo Install: Backend Dependencies
echo "#################################################"
npm install
echo "#################################################"
echo Done: Install Backend Dependencies
echo "#################################################"

echo "#################################################"
echo Start: Backend via PM2
echo "#################################################"
pm2 stop /home/bf/gh_actions_test/backend/index.js --name "test_backend"
pm2 start /home/bf/gh_actions_test/backend/index.js --name "test_backend"
cd /home/bf/gh_actions_test/frontend
echo "#################################################"
echo Install: Frontend Dependencies
echo "#################################################"
npm install --production=false
echo "#################################################"
echo Done: Install Frontend Dependencies
echo "#################################################"
echo "#################################################"
echo Start: Frontend Build
echo "#################################################"
npm run build
echo "#################################################"
echo Done: Frontend Build
echo "#################################################"
pm2 delete test_frontend
echo "#################################################"
echo Start: Frontend via PM2
echo "#################################################"
pm2 start npm --name "test_frontend" -- run serve
pm2 save
echo "-------------------------------------------------"
echo "#################################################"
echo ALL DONE
echo "#################################################"
echo "-------------------------------------------------"
