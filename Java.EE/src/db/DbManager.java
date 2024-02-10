package db;

import models.Task;

import java.util.ArrayList;

public class DbManager {
    private static ArrayList<Task> taskArrayList = new ArrayList<>();

    static {
        taskArrayList.add(new Task(1L, "Создать Веб приложение на JAVA EE", " ", "23.10.2021", true));
        taskArrayList.add(new Task(2L, "Убраться дома и закупить продукты", " ", "25.10.2021", true));
        taskArrayList.add(new Task(3L, "Выполнить все домашние задания", " ", "28.10.2021", false));
        taskArrayList.add(new Task(4L, "Записаться на качку", " ", "12.12.2021", false));
        taskArrayList.add(new Task(5L, "Учить Итальянский", " ", "01.05.2021", false));
    }

    public static ArrayList<Task> getAlltasks() {
        return taskArrayList;
    }

    public static void setTasksArrayList(ArrayList<Task> tasksArrayList) {
        DbManager.taskArrayList = tasksArrayList;
    }

    public static Task getTask(Long id){
        for(Task task : taskArrayList){
            if (task.getId() == id){
                return task;
            }
        }
        return null;
    }

    public static Task updateItem(Task task) {
        for (int i = 0; i < taskArrayList.size(); i++) {
            if (task.getId() == taskArrayList.get(i).getId()) {
                taskArrayList.set(i, task);
                return task;
            }
        }
        return null;
    }

    public static void deleteTask(Long id) {
        for (int i = 0; i < taskArrayList.size(); i++) {
            if (taskArrayList.get(i).getId() == id) {
                taskArrayList.remove(i);
                break;
            }
        }
    }

    public static void addTask(Task task) {
        taskArrayList.add(task);
    }
}