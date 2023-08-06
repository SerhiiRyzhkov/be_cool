package com.had0uken.be_cool.controller;

import com.had0uken.be_cool.enums.Type;
import com.had0uken.be_cool.model.Task;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;


@EnableTransactionManagement
@Controller
public abstract class AbstractTimeScalesController implements TimeScales{
    @Autowired
    private ModelViewFormatter modelViewFormatter;
    private Type type;
    private Map<LocalDate,String> dates = new LinkedHashMap<>();
    private List<Task> dateTasks=new ArrayList<>();

    protected void setType(Type type) {
        this.type = type;
    }

    @Override
    public Map<LocalDate, String> getDates() {
        return dates;
    }

    @Override
    public ModelAndView showTypeView(@RequestParam("delta") Integer delta, Authentication authentication) {
        shift(delta);
        ModelAndView modelAndView = modelViewFormatter.showTypeView(authentication,dates,type);
        dateTasks= modelViewFormatter.getToDo();
        return modelAndView;
    }
    @Override
    public ModelAndView setToday(){
        return modelViewFormatter.setTodayMethod(type);
    }

    @Override
    public ModelAndView completeTask(@RequestParam("index") Integer index, Authentication authentication) {
        return modelViewFormatter.complete(dateTasks.get(index), type);
    }

    @Override
    public ModelAndView addingNewTask(Authentication authentication){
        return modelViewFormatter.addingNewTask(authentication,type);
    }
    @Override
    public ModelAndView saveTask(@ModelAttribute("taskAtt") Task task,Authentication authentication){
        return modelViewFormatter.saveTask(task,authentication,type);
    }
    @Override
    public ModelAndView addFreqToday(@RequestParam("index") Integer index, Authentication authentication){
        return modelViewFormatter.addFreqToday(index,authentication,type);
    }

    abstract protected void shift(int delta);

}
