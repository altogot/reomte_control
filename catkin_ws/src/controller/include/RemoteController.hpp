#include <errno.h>
#include <fcntl.h>
#include <iostream>
#include <linux/input.h>
#include <linux/joystick.h>
#include <string.h>
#include <sys/stat.h>
#include <sys/types.h>
#include <unistd.h>
#include <thread>
#include <iostream>
namespace RemoteController {

#define XBOX_TYPE_BUTTON 0x01
#define XBOX_TYPE_AXIS 0x02

#define XBOX_BUTTON_A 0x00
#define XBOX_BUTTON_B 0x01
#define XBOX_BUTTON_X 0x02
#define XBOX_BUTTON_Y 0x03
#define XBOX_BUTTON_LB 0x04
#define XBOX_BUTTON_RB 0x05
#define XBOX_BUTTON_START 0x06
#define XBOX_BUTTON_BACK 0x07
#define XBOX_BUTTON_HOME 0x08
#define XBOX_BUTTON_LO 0x09 /* 左摇杆按键 */
#define XBOX_BUTTON_RO 0x0a /* 右摇杆按键 */

#define XBOX_BUTTON_ON 0x01
#define XBOX_BUTTON_OFF 0x00

#define XBOX_AXIS_LX 0x00 /* 左摇杆X轴 */
#define XBOX_AXIS_LY 0x01 /* 左摇杆Y轴 */
#define XBOX_AXIS_RX 0x03 /* 右摇杆X轴 */
#define XBOX_AXIS_RY 0x04 /* 右摇杆Y轴 */
#define XBOX_AXIS_LT 0x02
#define XBOX_AXIS_RT 0x05
#define XBOX_AXIS_XX 0x06 /* 方向键X轴 */
#define XBOX_AXIS_YY 0x07 /* 方向键Y轴 */

#define XBOX_AXIS_VAL_UP -32767
#define XBOX_AXIS_VAL_DOWN 32767
#define XBOX_AXIS_VAL_LEFT -32767
#define XBOX_AXIS_VAL_RIGHT 32767

#define XBOX_AXIS_VAL_MIN -32767
#define XBOX_AXIS_VAL_MAX 32767
#define XBOX_AXIS_VAL_MID 0x00

typedef struct xbox_map {
    int time;
    int a;
    int b;
    int x;
    int y;
    int lb;
    int rb;
    int start;
    int back;
    int home;
    int lo;
    int ro;

    int lx;
    int ly;
    int rx;
    int ry;
    int lt;
    int rt;
    int xx;
    int yy;

} xbox_map_t;

class Controller_G29 {

  public:

    ~Controller_G29();

    Controller_G29(const Controller_G29 &) = delete;

    Controller_G29 &operator=(const Controller_G29 &) = delete;

    static Controller_G29 &get_instance() {
        static Controller_G29 instance;
        return instance;
    }

    int xbox_open(const char *file_name);

    int xbox_map_read(int xbox_fd, xbox_map_t *map);

    void xbox_close(int xbox_fd);

  private:

    Controller_G29();
};

Controller_G29::Controller_G29() {
    printf("初始化远程控制器！\n");
}

Controller_G29::~Controller_G29() {
    printf("注销远程控制器！\n");
}

int Controller_G29::xbox_open(const char *file_name) {
    int xbox_fd;

    xbox_fd = open(file_name, O_RDONLY);
    if (xbox_fd < 0) {
        perror("open");
        return -1;
    }

    return xbox_fd;
}

int Controller_G29::xbox_map_read(int xbox_fd, xbox_map_t *map) {
    int len, type, number, value;
    struct js_event js;

    len = read(xbox_fd, &js, sizeof(struct js_event));
    if (len < 0) {
        perror("read");
        return -1;
    }

    type = js.type;
    number = js.number;
    value = js.value;

    map->time = js.time;

    if (type == JS_EVENT_BUTTON) {
        switch (number) {
        case XBOX_BUTTON_A:
            map->a = value;
            break;

        case XBOX_BUTTON_B:
            map->b = value;
            break;

        case XBOX_BUTTON_X:
            map->x = value;
            break;

        case XBOX_BUTTON_Y:
            map->y = value;
            break;

        case XBOX_BUTTON_LB:
            map->lb = value;
            break;

        case XBOX_BUTTON_RB:
            map->rb = value;
            break;

        case XBOX_BUTTON_START:
            map->start = value;
            break;

        case XBOX_BUTTON_BACK:
            map->back = value;
            break;

        case XBOX_BUTTON_HOME:
            map->home = value;
            break;

        case XBOX_BUTTON_LO:
            map->lo = value;
            break;

        case XBOX_BUTTON_RO:
            map->ro = value;
            break;

        default:
            break;
        }
    } else if (type == JS_EVENT_AXIS) {
        switch (number) {
        case XBOX_AXIS_LX:
            map->lx = value;
            break;

        case XBOX_AXIS_LY:
            map->ly = value;
            break;

        case XBOX_AXIS_RX:
            map->rx = value;
            break;

        case XBOX_AXIS_RY:
            map->ry = value;
            break;

        case XBOX_AXIS_LT:
            map->lt = value;
            break;

        case XBOX_AXIS_RT:
            map->rt = value;
            break;

        case XBOX_AXIS_XX:
            map->xx = value;
            break;

        case XBOX_AXIS_YY:
            map->yy = value;
            break;

        default:
            break;
        }
    } else {
        /* Init do nothing */
    }

    return len;
}

void Controller_G29::xbox_close(int xbox_fd) {
    close(xbox_fd);
    return;
}

} // namespace RemoteController
