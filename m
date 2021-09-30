Return-Path: <SRS0=5W5W=OU=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD555C433EF
	for <intel-gfx@archiver.kernel.org>; Thu, 30 Sep 2021 15:47:42 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8B34461267
	for <intel-gfx@archiver.kernel.org>; Thu, 30 Sep 2021 15:47:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8B34461267
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21B4C6E437;
	Thu, 30 Sep 2021 15:47:39 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DFFB6E436;
 Thu, 30 Sep 2021 15:47:37 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10123"; a="225294346"
X-IronPort-AV: E=Sophos;i="5.85,336,1624345200"; d="scan'208";a="225294346"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2021 08:47:36 -0700
X-IronPort-AV: E=Sophos;i="5.85,336,1624345200"; d="scan'208";a="655938105"
Received: from kjepstei-mobl.amr.corp.intel.com (HELO ldmartin-desk2)
 ([10.212.192.243])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2021 08:47:36 -0700
Date: Thu, 30 Sep 2021 08:47:36 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: intel-gfx@lists.freedesktop.org, Daniel Vetter <daniel.vetter@intel.com>,
 dri-devel@lists.freedesktop.org, Masahiro Yamada <masahiroy@kernel.org>,
 linux-kernel@vger.kernel.org
Message-ID: <20210930154736.3iunv53fko6oa6au@ldmartin-desk2>
X-Patchwork-Hint: comment
References: <20210929183357.1490204-1-lucas.demarchi@intel.com>
 <20210929183357.1490204-2-lucas.demarchi@intel.com>
 <87fstmuyrm.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <87fstmuyrm.fsf@intel.com>
Subject: Re: [Intel-gfx] [PATCH v2 1/3] drm/i915: rename IS_ACTIVE
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

On Thu, Sep 30, 2021 at 01:46:21PM +0300, Jani Nikula wrote:
>On Wed, 29 Sep 2021, Lucas De Marchi <lucas.demarchi@intel.com> wrote:
>> It took me some time to understand the need for IS_ACTIVE and why we
>> couldn't use kconfig.h.
>
>For anyone else wondering, the clues are in babaab2f4738 ("drm/i915:
>Encapsulate kconfig constant values inside boolean predicates").

yeah, I had added that info on the third patch when I try to move the
macro to kconfig.h since it would give information for kconfig
developers on why the macro is being used.

>
>But this series tries to take it further; we currently don't have a need
>for checking whether the config is defined or not. It always is. I mean
>it's probably a useful feature, but not the original problem we had.

yep, not trying to push hard on that direction... just tried to have the
same thing the other macros on kconfig.h have.

thanks
Lucas De Marchi
