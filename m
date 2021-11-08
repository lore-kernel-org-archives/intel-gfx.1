Return-Path: <SRS0=3waC=P3=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26641C433F5
	for <intel-gfx@archiver.kernel.org>; Mon,  8 Nov 2021 21:39:49 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BBE1561159
	for <intel-gfx@archiver.kernel.org>; Mon,  8 Nov 2021 21:39:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BBE1561159
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E7AA6E402;
	Mon,  8 Nov 2021 21:39:48 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 316156E402
 for <intel-gfx@lists.freedesktop.org>; Mon,  8 Nov 2021 21:39:46 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10162"; a="219528956"
X-IronPort-AV: E=Sophos;i="5.87,218,1631602800"; d="scan'208";a="219528956"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Nov 2021 13:39:45 -0800
X-IronPort-AV: E=Sophos;i="5.87,218,1631602800"; d="scan'208";a="491384102"
Received: from dtwiley-mobl1.amr.corp.intel.com (HELO ldmartin-desk2)
 ([10.209.61.201])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Nov 2021 13:39:45 -0800
Date: Mon, 8 Nov 2021 13:39:44 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Slade Watkins <slade@sladewatkins.com>
Message-ID: <20211108213944.d4fb2zghpookq35b@ldmartin-desk2>
X-Patchwork-Hint: comment
References: <20211108171922.845020-1-michael.cheng@intel.com>
 <87mtme7dhr.fsf@intel.com>
 <CA+pv=HMbMUP0zCLAh7_7vVVVxbT_PqM991H0Mjy=SB7WHz8fiQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <CA+pv=HMbMUP0zCLAh7_7vVVVxbT_PqM991H0Mjy=SB7WHz8fiQ@mail.gmail.com>
Subject: Re: [Intel-gfx] [PATCH 0/1] Introduce new i915 macros for checking
 PTEs
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
Cc: Jani Nikula <jani.nikula@intel.com>, siva.mullati@intel.com,
 intel-gfx@lists.freedesktop.org, michael.cheng@intel.com,
 wayne.boyer@intel.com
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

On Mon, Nov 08, 2021 at 03:21:58PM -0500, Slade Watkins wrote:
>Jani, all,
>
>On Mon, Nov 8, 2021 at 12:55 PM Jani Nikula <jani.nikula@intel.com> wrote:
>>
>> On Mon, 08 Nov 2021, Michael Cheng <michael.cheng@outlook.iglb.intel.com> wrote:
>> > From: Michael Cheng <michael.cheng@intel.com>
>>
>> Sender is Michael Cheng <michael.cheng@outlook.iglb.intel.com>, please
>> fix your git config.
>>
>
>I am unsure how this even happened in the first place, because
>outlook.iglb.intel.com doesn't even have any email related records
>(MX/SPF/DKIM), so messages aren't even being received anyway. I'm
>surprised it sent from there without being marked as spam, honestly.


 From the email headers:

	Received: from mwiznero-mobl2.amr.corp.intel.com (HELO
		mvcheng-desk2.intel.com) ([10.209.22.158])
		by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
		08 Nov 2021 09:19:27 -0800
	From: Michael Cheng <michael.cheng>@intel.com>

Note the additional ">" in the middle. I think the
outlook.iglb.intel.com part mentioned actually comes from an email client
behavior when you try to reply to such email... In my case mutt
tries to reply to michael.cheng@ldmartin-desk2, in which the second part
is my machine's hostname.

It was a simple misconfiguration in ~/.gitconfig.

Lucas De Marchi
