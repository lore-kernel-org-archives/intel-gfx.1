Return-Path: <SRS0=3Rq4=PR=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CA36C433F5
	for <intel-gfx@archiver.kernel.org>; Fri, 29 Oct 2021 02:51:04 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 53C7B61175
	for <intel-gfx@archiver.kernel.org>; Fri, 29 Oct 2021 02:51:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 53C7B61175
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8552F6E9B2;
	Fri, 29 Oct 2021 02:51:03 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B1526E9B1;
 Fri, 29 Oct 2021 02:51:02 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10151"; a="254157146"
X-IronPort-AV: E=Sophos;i="5.87,191,1631602800"; d="scan'208";a="254157146"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2021 19:51:01 -0700
X-IronPort-AV: E=Sophos;i="5.87,191,1631602800"; d="scan'208";a="580863380"
Received: from jons-linux-dev-box.fm.intel.com (HELO jons-linux-dev-box)
 ([10.1.27.20])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2021 19:51:00 -0700
Date: Thu, 28 Oct 2021 19:46:25 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: John.C.Harrison@Intel.com
Cc: IGT-Dev@Lists.FreeDesktop.Org, Intel-GFX@Lists.FreeDesktop.Org
Message-ID: <20211029024625.GA33196@jons-linux-dev-box>
References: <20211021234044.3071069-1-John.C.Harrison@Intel.com>
 <20211021234044.3071069-7-John.C.Harrison@Intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211021234044.3071069-7-John.C.Harrison@Intel.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Subject: Re: [Intel-gfx] [igt-dev] [PATCH i-g-t 6/8] lib/igt_sysfs: Support
 large files
X-BeenThere: intel-gfx@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel graphics driver community testing & development
 <intel-gfx.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=subscribe>
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

On Thu, Oct 21, 2021 at 04:40:42PM -0700, John.C.Harrison@Intel.com wrote:
> From: John Harrison <John.C.Harrison@Intel.com>
> 
> The syfs helper functions were all using basic 'int' data types for
> sizs, offsets, etc. when reading from sysfs. This works fine for
> little files, but not for large error capture logs (which can be
> gigabytes in sizes).
> 
> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  lib/igt_sysfs.c | 17 +++++++++++------
>  1 file changed, 11 insertions(+), 6 deletions(-)
> 
> diff --git a/lib/igt_sysfs.c b/lib/igt_sysfs.c
> index 6919ac361..ee75e3ef1 100644
> --- a/lib/igt_sysfs.c
> +++ b/lib/igt_sysfs.c
> @@ -53,9 +53,11 @@
>   * provides basic support for like igt_sysfs_open().
>   */
>  
> -static int readN(int fd, char *buf, int len)
> +static ssize_t readN(int fd, char *buf, size_t len)
>  {
> -	int ret, total = 0;
> +	ssize_t ret;
> +	size_t total = 0;
> +
>  	do {
>  		ret = read(fd, buf + total, len - total);
>  		if (ret < 0)
> @@ -69,9 +71,11 @@ static int readN(int fd, char *buf, int len)
>  	return total ?: ret;
>  }
>  
> -static int writeN(int fd, const char *buf, int len)
> +static ssize_t writeN(int fd, const char *buf, size_t len)
>  {
> -	int ret, total = 0;
> +	ssize_t ret;
> +	size_t total = 0;
> +
>  	do {
>  		ret = write(fd, buf + total, len - total);
>  		if (ret < 0)
> @@ -218,8 +222,9 @@ bool igt_sysfs_set(int dir, const char *attr, const char *value)
>  char *igt_sysfs_get(int dir, const char *attr)
>  {
>  	char *buf;
> -	int len, offset, rem;
> -	int ret, fd;
> +	size_t len, offset, rem;
> +	ssize_t ret;
> +	int fd;
>  
>  	fd = openat(dir, attr, O_RDONLY);
>  	if (igt_debug_on(fd < 0))
> -- 
> 2.25.1
> 
