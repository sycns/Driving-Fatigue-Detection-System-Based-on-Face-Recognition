#include <opencv2/opencv.hpp>

using namespace cv;

int main()
{
	//��ȡͼƬ��ʹ��ͼƬ�ľ���·����
	Mat src = imread("01.jpg");
	//��ʾͼƬ
	imshow("Output", src);
	//��ʾ�Ҷ�ͼ
	Mat Gray;
	cvtColor(src, Gray, 6);
	imshow("Gray", Gray);

	//���Ӵ����ͼƬ��һ������
	waitKey(0);

	return 0;
}

