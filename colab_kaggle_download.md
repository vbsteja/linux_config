!wget https://cdn.pixabay.com/photo/2014/11/30/14/11/kitty-551554__340.jpg
!pip install --user kaggle
!rm -r /root/.kaggle
!mkdir /root/.kaggle
!echo '{"username":"vbsuryateja2","key":"*************"}' > /root/.kaggle/kaggle.json
!kaggle competitions download -c dogs-vs-cats
!unzip test1.zip
!unzip train.zip
