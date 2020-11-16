Return-Path: <SRS0=ME6F=EW=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,HK_RANDOM_FROM,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A1CCC4742C
	for <intel-gfx@archiver.kernel.org>; Mon, 16 Nov 2020 11:13:07 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 182B822263
	for <intel-gfx@archiver.kernel.org>; Mon, 16 Nov 2020 11:13:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 182B822263
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CE8C89E11;
	Mon, 16 Nov 2020 11:13:06 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C773189E0E;
 Mon, 16 Nov 2020 11:13:04 +0000 (UTC)
IronPort-SDR: krEMHiDCc5Yg3thosJmKB81k6PC4dB4r6t5B85LqBdqJDnC+aEghbY0+H9sSpjAZ0biHCoRd4y
 gWMVgFE6M02Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9806"; a="150000055"
X-IronPort-AV: E=Sophos;i="5.77,482,1596524400"; d="scan'208";a="150000055"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2020 03:13:02 -0800
IronPort-SDR: 2+oRimt8EuIk4yiF9XwDQnTqsvuhvOpA+FlHg2FmB2eUELIVdISdCJpPXmd6cdbgMvl1ymE2k7
 +tZIaXY/APJQ==
X-IronPort-AV: E=Sophos;i="5.77,482,1596524400"; d="scan'208";a="543564136"
Received: from abaldovi-mobl.ger.corp.intel.com (HELO [10.252.52.236])
 ([10.252.52.236])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2020 03:13:01 -0800
To: Chris Wilson <chris@chris-wilson.co.uk>, intel-gfx@lists.freedesktop.org
References: <20201113135618.1235497-1-chris@chris-wilson.co.uk>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
Message-ID: <28e4553d-1ae0-94a8-dc43-a0b4bb19d156@linux.intel.com>
Date: Mon, 16 Nov 2020 11:12:55 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201113135618.1235497-1-chris@chris-wilson.co.uk>
Content-Language: en-US
Subject: Re: [Intel-gfx] [igt-dev] [PATCH i-g-t] tools/intel_gpu_top: Show
 the active device
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
Cc: igt-dev@lists.freedesktop.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>


On 13/11/2020 13:56, Chris Wilson wrote:
> Include the active device name on the update screen.
> 
> Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
> ---
>   tools/intel_gpu_top.c | 11 +++++++----
>   1 file changed, 7 insertions(+), 4 deletions(-)
> 
> diff --git a/tools/intel_gpu_top.c b/tools/intel_gpu_top.c
> index 298defa4e..c16e80502 100644
> --- a/tools/intel_gpu_top.c
> +++ b/tools/intel_gpu_top.c
> @@ -1027,7 +1027,8 @@ static bool print_groups(struct cnt_group **groups)
>   }
>   
>   static int
> -print_header(struct engines *engines, double t,
> +print_header(const struct igt_device_card *card,
> +	     struct engines *engines, double t,
>   	     int lines, int con_w, int con_h, bool *consumed)
>   {
>   	struct pmu_counter fake_pmu = {
> @@ -1106,14 +1107,15 @@ print_header(struct engines *engines, double t,
>   		printf("\033[H\033[J");
>   
>   		if (lines++ < con_h) {
> +			printf("intel-gpu-top: %s - ", card->card);
>   			if (!engines->discrete)
> -				printf("intel-gpu-top - %s/%s MHz;  %s%% RC6; %s %s; %s irqs/s\n",
> +				printf("%s/%s MHz;  %s%% RC6; %s %s; %s irqs/s\n",
>   					freq_items[1].buf, freq_items[0].buf,
>   					rc6_items[0].buf, power_items[0].buf,
>   					engines->rapl_unit,
>   					irq_items[0].buf);
>   			else
> -				printf("intel-gpu-top - %s/%s MHz;  %s%% RC6; %s irqs/s\n",
> +				printf("%s/%s MHz;  %s%% RC6; %s irqs/s\n",
>   					freq_items[1].buf, freq_items[0].buf,
>   					rc6_items[0].buf, irq_items[0].buf);
>   		}
> @@ -1457,7 +1459,8 @@ int main(int argc, char **argv)
>   			break;
>   
>   		while (!consumed) {
> -			lines = print_header(engines, t, lines, con_w, con_h,
> +			lines = print_header(&card, engines,
> +					     t, lines, con_w, con_h,
>   					     &consumed);
>   
>   			if (engines->imc_fd)
> 

Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

Regards,

Tvrtko
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
