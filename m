Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BA98C55184
	for <intel-gfx@archiver.kernel.org>; Mon,  3 Aug 2026 15:05:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A14F10E705;
	Mon,  3 Aug 2026 15:05:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="deuvw9KW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C29E10E701
 for <intel-gfx@lists.freedesktop.org>; Mon,  3 Aug 2026 15:05:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785769501; x=1817305501;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=ciXSvr6JT7A1pHbO54Y099EuvOXcKI/MUHBtMiHKr4A=;
 b=deuvw9KWF05u97jNpdctLkkB/cGD8WF+CBpwW9DKQ4PbSm8oOE+ADE9t
 lkDrKifSNdeXfGdAuvc9OIwtx0uXOekAHVnwvGacslS8e7Te5OS9dySJK
 zpIhdlybYMP1vcTPOVmWJiJaV6nyyZ9pZZFr3APDXLtmz3qObLzm2F6Zs
 OJbxmXEnfZAvsh20+9/ML+Bo8XChGQ25FhUQ2uky7kaAWhvjLBQgJhsMs
 cG6iYxFPOwCgXGrdjhIKU8OaOITKu4oCEMgQNc4FN4cfKEJ7Di/yEagi4
 AXXrVJayqS2vxK8UnVUTQH/PqAEPSYsb21dDiLX5v6eC9ot9a1pk4l2Op Q==;
X-CSE-ConnectionGUID: 8IvESjSYTkuiTCg96qDWIg==
X-CSE-MsgGUID: GbA6qU7LT4+cEapo3scNDA==
X-IronPort-AV: E=McAfee;i="6800,10657,11864"; a="103706148"
X-IronPort-AV: E=Sophos;i="6.25,202,1779174000"; d="scan'208";a="103706148"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Aug 2026 08:05:00 -0700
X-CSE-ConnectionGUID: xkzujyIrQXCyPdXtRx/RpQ==
X-CSE-MsgGUID: fJd8gHoOTmCNnpFhAnco6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,202,1779174000"; d="scan'208";a="291176003"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
 by orviesa002.jf.intel.com with ESMTP; 03 Aug 2026 08:04:59 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
 (envelope-from <lkp@intel.com>) id 1wquDo-000000007AX-2kkM;
 Mon, 03 Aug 2026 15:04:56 +0000
Date: Mon, 3 Aug 2026 23:04:17 +0800
From: kernel test robot <lkp@intel.com>
To: Seliverstov Daniil Denisovich <daniil.seliverstov2003@gmail.com>,
 intel-gfx@lists.freedesktop.org
Cc: oe-kbuild-all@lists.linux.dev,
 Seliverstov Daniil Denisovich <Danayerofficial@yandex.ru>
Subject: Re: [PATCH] drm/xe: add DG2 HuC GSC support and MEI integration
Message-ID: <202608032214.SO0sxuT6-lkp@intel.com>
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
config: um-randconfig-001-20260803 (https://download.01.org/0day-ci/archive/20260803/202608032214.SO0sxuT6-lkp@intel.com/config)
compiler: gcc-13 (Debian 13.3.0-16) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260803/202608032214.SO0sxuT6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608032214.SO0sxuT6-lkp@intel.com/

All errors (new ones prefixed by >>):

   /usr/bin/ld: drivers/gpu/drm/xe/xe_mei_dg2.o: in function `xe_mei_dg2_auth_huc':
>> xe_mei_dg2.c:(.text+0x13f): undefined reference to `mei_cldev_enabled'
>> /usr/bin/ld: xe_mei_dg2.c:(.text+0x1a1): undefined reference to `mei_cldev_send'
>> /usr/bin/ld: xe_mei_dg2.c:(.text+0x1bd): undefined reference to `mei_cldev_recv'
>> /usr/bin/ld: xe_mei_dg2.c:(.text+0x1f4): undefined reference to `mei_cldev_enable'
   collect2: error: ld returned 1 exit status

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
