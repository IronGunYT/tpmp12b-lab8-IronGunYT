//
//  ViewController.m
//  tpmp_lab8_2.1
//
//  Created by Demid on 12.05.24.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *canvas;
@property (weak, nonatomic) IBOutlet UILabel *widthLabel;
@property (weak, nonatomic) IBOutlet UILabel *colorLabel;
@property (weak, nonatomic) IBOutlet UISlider *thicknessSlider;
@property (weak, nonatomic) IBOutlet UISlider *redSlider;
@property (weak, nonatomic) IBOutlet UISlider *greenSlider;
@property (weak, nonatomic) IBOutlet UISlider *blueSlider;
@property (weak, nonatomic) IBOutlet UIButton *saveButton;

@property CGPoint lastPoint;
@property double width;
@property double red;
@property double green;
@property double blue;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _width = 0.5;
    _widthLabel.text = [NSString stringWithFormat:@"Thickness: %.1f", _width * 10];
    _red = 0.5;
    _green = 0.5;
    _blue = 0.5;
    _colorLabel.text = [NSString stringWithFormat:@"red: %d, green: %d, blue: %d", (int)(_red * 255), (int)(_green * 255), (int)(_blue * 255)];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [touches anyObject];
    [self setLastPoint:[touch locationInView:self.canvas]];
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [touches anyObject];
    CGPoint currentPoint = [touch locationInView:self.canvas];
    
    UIGraphicsBeginImageContext(self.canvas.frame.size);
    [self.canvas.image drawInRect:CGRectMake(0.0f, 0.0f, self.canvas.frame.size.width, self.canvas.frame.size.height)];
    
    CGContextSetLineCap(UIGraphicsGetCurrentContext(), kCGLineCapRound);
    CGContextSetLineWidth(UIGraphicsGetCurrentContext(), _width * 10);
    CGContextSetRGBStrokeColor(UIGraphicsGetCurrentContext(), _red, _green, _blue, 1.0f);
    
    CGContextBeginPath(UIGraphicsGetCurrentContext());
    CGContextMoveToPoint(UIGraphicsGetCurrentContext(), _lastPoint.x, _lastPoint.y);
    CGContextAddLineToPoint(UIGraphicsGetCurrentContext(), currentPoint.x, currentPoint.y);
    
    CGContextStrokePath(UIGraphicsGetCurrentContext());
    
    UIImage *drawnImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    [self.canvas setImage:drawnImage];
    
    _lastPoint = currentPoint;
}

- (IBAction)saveClick:(id)sender {
    UIImage *image = self.canvas.image;
    if (image) {
        UIImageWriteToSavedPhotosAlbum(image, nil, @selector(image:didFinishSavingWithError:contextInfo:), nil);
    }
}

- (void)image:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo {
    if (error) {
        NSLog(@"Ошибка при сохранении изображения: %@", error.localizedDescription);
    } else {
        NSLog(@"Все хорошо при сохранении изображения");
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Успех"
                                                                       message:@"Изображение успешно сохранено в фотобиблиотеку"
                                                                preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"OK"
                                                           style:UIAlertActionStyleDefault
                                                         handler:nil];
        
        [alert addAction:okAction];
        
        [self presentViewController:alert animated:YES completion:nil];
    }
}
- (IBAction)widthChange:(id)sender {
    _width = self.thicknessSlider.value;
    self.widthLabel.text = [NSString stringWithFormat:@"Thickness: %.1f", _width * 10];
}

- (IBAction)redChange:(id)sender {
    _red = self.redSlider.value;
    self.colorLabel.text = [NSString stringWithFormat:@"red: %d, green: %d, blue: %d", (int)(_red * 255), (int)(_green * 255), (int)(_blue * 255)];
}

- (IBAction)greenChange:(id)sender {
    _green = self.greenSlider.value;
    self.colorLabel.text = [NSString stringWithFormat:@"red: %d, green: %d, blue: %d", (int)(_red * 255), (int)(_green * 255), (int)(_blue * 255)];
}

- (IBAction)blueChange:(id)sender {
    _blue = self.blueSlider.value;
    self.colorLabel.text = [NSString stringWithFormat:@"red: %d, green: %d, blue: %d", (int)(_red * 255), (int)(_green * 255), (int)(_blue * 255)];
}

@end
