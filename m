Return-Path: <SRS0=qNAp=D3=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A11E4C433DF
	for <intel-gfx@archiver.kernel.org>; Tue, 20 Oct 2020 09:48:04 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 40A4722242
	for <intel-gfx@archiver.kernel.org>; Tue, 20 Oct 2020 09:48:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 40A4722242
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E99866EC29;
	Tue, 20 Oct 2020 09:48:00 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 147566EC24;
 Tue, 20 Oct 2020 09:48:00 +0000 (UTC)
IronPort-SDR: 4Wf0A9VQS2mJXPk2uwCoOLE6f4J6wNR1+4yVwf1A26Q4cAJWh4URHsGv9suR+wJC2zIZsU1aTL
 eHwSCurhhEJA==
X-IronPort-AV: E=McAfee;i="6000,8403,9779"; a="146476097"
X-IronPort-AV: E=Sophos;i="5.77,396,1596524400"; d="scan'208";a="146476097"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2020 02:47:59 -0700
IronPort-SDR: YLl+tuvLOZJarVxhlNfLLufJ7DJEG1B6+h2/mamvk0zcSUgqc4JZCAX81Qw9zfA+7rVmLHscWq
 zKfx0OLuUzyA==
X-IronPort-AV: E=Sophos;i="5.77,396,1596524400"; d="scan'208";a="532993174"
Received: from pshakya-mobl1.gar.corp.intel.com (HELO [10.252.55.30])
 ([10.252.55.30])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2020 02:47:57 -0700
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Anshuman Gupta <anshuman.gupta@intel.com>, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
References: <20201019071259.24566-1-anshuman.gupta@intel.com>
 <8736299qtu.fsf@intel.com>
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Message-ID: <5fb7a376-d520-97e0-54cd-6174019ce1d1@linux.intel.com>
Date: Tue, 20 Oct 2020 11:47:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.3
MIME-Version: 1.0
In-Reply-To: <8736299qtu.fsf@intel.com>
Content-Language: en-US
Subject: Re: [Intel-gfx] [RFC] drm/hdcp: Max MST content streams
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
Cc: Sean Paul <seanpaul@chromium.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Maxime Ripard <mripard@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

Op 20-10-2020 om 11:42 schreef Jani Nikula:
> On Mon, 19 Oct 2020, Anshuman Gupta <anshuman.gupta@intel.com> wrote:
>> Let's define Maximum MST content streams up to four
>> generically which can be supported by modern display
>> controllers.
>>
>> Cc: Sean Paul <seanpaul@chromium.org>
>> Cc: Ramalingam C <ramalingam.c@intel.com>
>> Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
> Hey drm-misc maintainers,
>
> I'd like to get an ack to merge this via drm-intel as part of [1].
>
> Thanks,
> Jani.
>
>
>
> [1] http://lore.kernel.org/r/20201014045252.13608-1-anshuman.gupta@intel.com
>
>
>
>> ---
>>  include/drm/drm_hdcp.h | 8 ++++----
>>  1 file changed, 4 insertions(+), 4 deletions(-)
>>
>> diff --git a/include/drm/drm_hdcp.h b/include/drm/drm_hdcp.h
>> index fe58dbb46962..ac22c246542a 100644
>> --- a/include/drm/drm_hdcp.h
>> +++ b/include/drm/drm_hdcp.h
>> @@ -101,11 +101,11 @@
>>  
>>  /* Following Macros take a byte at a time for bit(s) masking */
>>  /*
>> - * TODO: This has to be changed for DP MST, as multiple stream on
>> - * same port is possible.
>> - * For HDCP2.2 on HDMI and DP SST this value is always 1.
>> + * TODO: HDCP_2_2_MAX_CONTENT_STREAMS_CNT is based upon actual
>> + * H/W MST streams capacity.
>> + * This required to be moved out to platform specific header.
>>   */
>> -#define HDCP_2_2_MAX_CONTENT_STREAMS_CNT	1
>> +#define HDCP_2_2_MAX_CONTENT_STREAMS_CNT	4
>>  #define HDCP_2_2_TXCAP_MASK_LEN			2
>>  #define HDCP_2_2_RXCAPS_LEN			3
>>  #define HDCP_2_2_RX_REPEATER(x)			((x) & BIT(0))

Well since it's such a small change..

Acked-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
