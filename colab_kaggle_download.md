!wget https://cdn.pixabay.com/photo/2014/11/30/14/11/kitty-551554__340.jpg
!pip install --user kaggle
!rm -r /root/.kaggle
!mkdir /root/.kaggle
!echo '{"username":"vbsuryateja2","key":"ec25e4ae0d0c1e24d21f8d7ad681d9f8"}' > /root/.kaggle/kaggle.json
!kaggle competitions download -c dogs-vs-cats
!unzip test1.zip
!unzip train.zip
