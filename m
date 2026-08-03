Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4F9AC55184
	for <intel-gfx@archiver.kernel.org>; Mon,  3 Aug 2026 16:05:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7347810E05A;
	Mon,  3 Aug 2026 16:05:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ToFQvn48";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F203810E05A
 for <intel-gfx@lists.freedesktop.org>; Mon,  3 Aug 2026 16:05:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785773125; x=1817309125;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=YcdBmkMWXfpNLO1mjAJwRxn+WVOFAHTbKF/ibGb9zVg=;
 b=ToFQvn48ZOG9/jm0JcfsJ76UhIhRvgy14V2EU+cXrGUzlejTY8c7Xkou
 gYRWpX+h+m55uFuvjWrgR5oc7W58vz580Ed/j20id8wblpV50pyKji4QF
 fKx3fMJYI3oNPS70/1OiScnDFnYpe3UjqwjPvSADjIMTriDVgfiQkgQHX
 rGkZb3jG89Kj+l55LueldtDgvB7i6g9NBgaPtCAY15BE8Dq39NlklhU2Y
 OrI/afwJRaCvhwrY1UnjC4e4H3KcJ5SauIERAz1ucfuw12uG+vNUhbimr
 oSNKZzzEln7TpsR+rFjKPTe2P2WOCTH9fljCeURGyr04gx4Vj7CTyfyn2 A==;
X-CSE-ConnectionGUID: UmJhnQqURgqTV5j+dJT9ow==
X-CSE-MsgGUID: yJ7ZNJnWQ/iB8ixWNWfoSg==
X-IronPort-AV: E=McAfee;i="6800,10657,11864"; a="86083256"
X-IronPort-AV: E=Sophos;i="6.25,202,1779174000"; d="scan'208";a="86083256"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Aug 2026 09:05:24 -0700
X-CSE-ConnectionGUID: rbErsgA4T7KT2pZwsRWxiQ==
X-CSE-MsgGUID: +gFiPfEZR+yBdKvAzf8ewA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,202,1779174000"; d="scan'208";a="284648635"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
 by fmviesa002.fm.intel.com with ESMTP; 03 Aug 2026 09:05:23 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
 (envelope-from <lkp@intel.com>) id 1wqvAG-000000007HF-2i8G;
 Mon, 03 Aug 2026 16:05:20 +0000
Date: Tue, 4 Aug 2026 00:04:21 +0800
From: kernel test robot <lkp@intel.com>
To: Seliverstov Daniil Denisovich <daniil.seliverstov2003@gmail.com>,
 intel-gfx@lists.freedesktop.org
Cc: oe-kbuild-all@lists.linux.dev,
 Seliverstov Daniil Denisovich <Danayerofficial@yandex.ru>
Subject: Re: [PATCH] drm/xe: add DG2 HuC GSC support and MEI integration
Message-ID: <202608032357.ba3Vit6A-lkp@intel.com>
References: <20260731120427.864560-1-daniil.seliverstov2003@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260731120427.864560-1-daniil.seliverstov2003@gmail.com>
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

Hi Seliverstov,

kernel test robot noticed the following build errors:

[auto build test ERROR on drm-xe/drm-xe-next]
[also build test ERROR on drm-i915/for-linux-next drm-i915/for-linux-next-fixes drm-tip/drm-tip linus/master v7.2-rc6 next-20260731]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Seliverstov-Daniil-Denisovich/drm-xe-add-DG2-HuC-GSC-support-and-MEI-integration/20260803-151027
base:   https://gitlab.freedesktop.org/drm/xe/kernel.git drm-xe-next
patch link:    https://lore.kernel.org/r/20260731120427.864560-1-daniil.seliverstov2003%40gmail.com
patch subject: [PATCH] drm/xe: add DG2 HuC GSC support and MEI integration
config: arm-randconfig-001-20260803 (https://download.01.org/0day-ci/archive/20260803/202608032357.ba3Vit6A-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260803/202608032357.ba3Vit6A-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608032357.ba3Vit6A-lkp@intel.com/

All errors (new ones prefixed by >>):

   arm-linux-gnueabi-ld: drivers/gpu/drm/xe/xe_mei_dg2.o: in function `xe_mei_dg2_auth_huc':
>> drivers/gpu/drm/xe/xe_mei_dg2.c:81: undefined reference to `mei_cldev_enabled'
>> arm-linux-gnueabi-ld: drivers/gpu/drm/xe/xe_mei_dg2.c:95: undefined reference to `mei_cldev_send'
>> arm-linux-gnueabi-ld: drivers/gpu/drm/xe/xe_mei_dg2.c:101: undefined reference to `mei_cldev_recv'
>> arm-linux-gnueabi-ld: drivers/gpu/drm/xe/xe_mei_dg2.c:82: undefined reference to `mei_cldev_enable'


vim +81 drivers/gpu/drm/xe/xe_mei_dg2.c

    58	
    59	int xe_mei_dg2_auth_huc(struct xe_device *xe, struct xe_huc *huc)
    60	{
    61		struct device *cl_dev = NULL;
    62		struct mei_cl_device *cldev;
    63		struct pxp43_start_huc_auth_in in = { 0 };
    64		struct pxp43_huc_auth_out out = { 0 };
    65		ssize_t byte;
    66		int ret;
    67		static int retry_count;
    68	
    69		device_for_each_child(xe->drm.dev, &cl_dev, find_pxp_client_deep);
    70	
    71		if (!cl_dev) {
    72			if (retry_count++ % 5 == 0)
    73				drm_info(&xe->drm,
    74					 "HuC auth: waiting for MEI PXP client (HECI1) to initialize...\n");
    75			return -EAGAIN;
    76		}
    77	
    78		get_device(cl_dev);
    79		cldev = to_mei_cl_device(cl_dev);
    80	
  > 81		if (!mei_cldev_enabled(cldev)) {
  > 82			ret = mei_cldev_enable(cldev);
    83			if (ret) {
    84				put_device(cl_dev);
    85				return -EAGAIN;
    86			}
    87		}
    88	
    89		in.header.api_version = PXP_APIVER(4, 3);
    90		in.header.command_id = PXP43_CMDID_START_HUC_AUTH;
    91		in.header.buffer_len = sizeof(in.huc_base_address);
    92		in.huc_base_address =
    93			cpu_to_le64(xe_bo_main_addr(huc->fw.bo, PAGE_SIZE));
    94	
  > 95		byte = mei_cldev_send(cldev, (u8 *)&in, sizeof(in));
    96		if (byte < 0) {
    97			put_device(cl_dev);
    98			return byte;
    99		}
   100	
 > 101		byte = mei_cldev_recv(cldev, (u8 *)&out, sizeof(out));

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
