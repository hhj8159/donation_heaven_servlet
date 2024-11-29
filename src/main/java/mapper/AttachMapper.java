package mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import vo.Attach;

public interface AttachMapper {
	@Insert("insert into attach (uuid, origin, path, image, pno) values (#{uuid}, #{origin}, #{path}, #{image}, #{pno})")
	int insert(Attach attach);	
	
	@Select("select * from attach where pno= #{pno}")
	List<Attach> selectList(Long pno);
	
	@Delete("delete from attach where pno = #{pno}")
	int delete(Long pno);
	
	@Update("update attach set download_count = download_count + 1 where uuid = #{uuid}")
	int increaseDownloadCount(String uuid);
	
}