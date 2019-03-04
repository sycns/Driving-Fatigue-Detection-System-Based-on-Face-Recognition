#include <opencv2/opencv.hpp>
#include <iostream>

using namespace cv;
using namespace std;

int main(int argc,char** argv)
{
	namedWindow("Example_capture", WINDOW_AUTOSIZE);

	VideoCapture cap;

	if (argc == 1) {
		cap.open(0);
	}
	else {
		cap.open(argv[1]);
	}

	if (!cap.isOpened()) {
		cerr << "Couldn't open capture." << endl;
		return -1;
	}

	//不加此语句图片会一闪而过
	waitKey(0);

	return 0;
}

