#include "RemoteController.hpp"

// 一个虚拟函数
void foo(int Z) {
    for (int i = 0; i < Z; i++) {
        sleep(1);
    }
}

int create_RemoteController(RemoteController::Controller_G29 &controller,
                            int xbox_fd) {
    RemoteController::xbox_map_t map;
    int len, type;
    int axis_value, button_value;
    int number_of_axis, number_of_buttons;

    memset(&map, 0, sizeof(RemoteController::xbox_map_t));

    // RemoteController::Controller_G29 &controller =
    //     RemoteController::Controller_G29::get_instance();

    // xbox_fd = controller.xbox_open("/dev/input/js0");
    if (xbox_fd < 0) {
        return -1;
    }

    while (1) {
        len = controller.xbox_map_read(xbox_fd, &map);
        if (len < 0) {
            usleep(10 * 1000);
            continue;
        }
        printf("\rSteer:%-6d  Brake:%-6d  Acc:%-6d", map.lx, map.rx, map.lt);
        fflush(stdout);
    }

    controller.xbox_close(xbox_fd);

    return 0;
}

int main(void) {
    // int xbox_fd;
    // RemoteController::xbox_map_t map;
    // int len, type;
    // int axis_value, button_value;
    // int number_of_axis, number_of_buttons;

    // memset(&map, 0, sizeof(RemoteController::xbox_map_t));

    // RemoteController::Controller_G29 &controller =
    //     RemoteController::Controller_G29::get_instance();

    // xbox_fd = controller.xbox_open("/dev/input/js0");
    // if (xbox_fd < 0) {
    //     return -1;
    // }
    RemoteController::Controller_G29 &controller =
        RemoteController::Controller_G29::get_instance();

    int xbox_fd = controller.xbox_open("/dev/input/js0");

    std::thread th1(foo, 10);

    std::thread th2(create_RemoteController, std::ref(controller), xbox_fd);

    th1.join();

    th2.detach();

    controller.xbox_close(xbox_fd);

    return 0;
}
