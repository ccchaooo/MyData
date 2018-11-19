
// Java里面打印日志，不要用System.out.println("");
// 用Log框架
static org.apache.commons.logging.Log LOG = org.apache.commons.logging.LogFactory.getLog(当前类名.class);

// 记录日志
if (LOG.isXxxEnabled()) {
    LOG.xxxx("yyyyyy");   // 普通日志
    LOG.xxxx("yyyyyy", e);  //e 为异常对象
}
