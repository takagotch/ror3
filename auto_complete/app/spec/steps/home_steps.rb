step 'micropost_content @ar auto_complete' do
  fill_autocomplete 'micropost_content', with: '@ar'
end

step 'Post click_button' do
  click_button 'Post'
end

