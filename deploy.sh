cd /home/bf/gh_actions_test/backend
echo "-------------------------------"
echo "-------------------------------"
echo Installing backend dependencies
echo "-------------------------------"
echo "-------------------------------"
npm install
echo "-------------------------"
echo "-------------------------"
echo Backend dependencies done
echo "-------------------------"
echo "-------------------------"
echo "------------------------"
echo "------------------------"
echo Starting Backend via PM2
echo "------------------------"
echo "------------------------"
pm2 stop /home/bf/gh_actions_test/backend/index.js --name "test_backend"
pm2 start /home/bf/gh_actions_test/backend/index.js --name "test_backend"
cd /home/bf/gh_actions_test/frontend
echo "--------------------------------"
echo "--------------------------------"
echo Installing Frontend dependencies
echo "--------------------------------"
echo "--------------------------------"
npm install --production=false
echo "--------------------------"
echo "--------------------------"
echo Frontend dependencies done
echo "--------------------------"
echo "--------------------------"
echo "-----------------------"
echo "-----------------------"
echo Starting Frontend build
echo "-----------------------"
echo "-----------------------"
npm run build
echo "-------------------"
echo "-------------------"
echo Frontend build done
echo "-------------------"
echo "-------------------"
pm2 delete test_frontend
echo "-------------------------"
echo "-------------------------"
echo Starting Frontend via PM2
echo "-------------------------"
echo "-------------------------"
pm2 start npm --name "test_frontend" -- run serve
pm2 save
echo "------------------------"
echo "------------------------"
echo All done, enjoy Success!
echo "------------------------"
echo "------------------------"