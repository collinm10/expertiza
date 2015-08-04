class Checkbox < UnscoredQuestion
  #This method returns what to display if an instructor (etc.) is creating or editing a questionnaire (questionnaires_controller.rb)
  def edit(count)
    html ='<tr>'
    html+='<td align="center"><input id="question_chk' +count.to_s+ '" type="checkbox"></td>'
    html+='<td><input size="6" value="'+self.seq.to_s+'" name="question['+self.id.to_s+'][seq]" id="question_'+self.id.to_s+'_seq" type="text"></td>'
    html+='<td><textarea cols="50" rows="1" name="question['+self.id.to_s+'][txt]" id="question_'+self.id.to_s+'_txt">'+self.txt+'</textarea></td>'
    html+='<td><input size="10" disabled="disabled" value="'+self.type+'" name="question['+self.id.to_s+'][type]" id="question_'+self.id.to_s+'_type" type="text">''</td>'
    html+='<td><input size="6" value="'+self.weight.to_s+'" name="question['+self.id.to_s+'][weight]" id="question_'+self.id.to_s+'_weight" type="text">''</td>'
    html+='</tr>'

    html.html_safe
  end

  #This method returns what to display if an instructor (etc.) is viewing a questionnaire
  def view_question_text
    html = '<TR><TD align="left"> '+self.txt+' </TD>'
    html += '<TD align="left">'+self.type+'</TD>'
    html += '<td align="center">'+self.weight.to_s+'</TD>'
    html += '<TD align="center">True/False</TD>'
    html += '</TR>'
    html.html_safe
  end

  def complete
    ''
  end

  #This method returns what to display if a student is viewing a filled-out questionnaire
  def view_completed_question(count, answer)
    
    if answer.answer == 1
      html = '<big><b>Question '+count.to_s+':</b><img src="/images/Check-icon.png"><i>'+self.txt+'</i></big><br/><br/>'
    else
      html = '<big><b>Question '+count.to_s+':</b><img src="/images/delete-icon.png"><i>'+self.txt+'</i></big><br/><br/>'
    end
    html.html_safe
  end

  def self.checked?(response_id)
    answer = Answer.where(question_id: self.id, response_id: response_id).first
    return answer.comment == '0'
  end
end
